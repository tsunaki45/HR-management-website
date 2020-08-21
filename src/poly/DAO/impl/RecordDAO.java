package poly.DAO.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import poly.DAO.IRecordDAO;
import poly.entity.Record;

@Repository
public class RecordDAO implements IRecordDAO {
	
	@Autowired
	SessionFactory factory;
	
	@Override
	public List<Record> findAll() {
		
		return factory.getCurrentSession().createQuery("FROM Record r ORDER BY r.date DESC").list();
	}
	
	@Override
	public List<Object[]> findAllExcellentStaff() {
		
		Session session =factory.getCurrentSession();
		
		StringBuffer hql = new StringBuffer("SELECT r.staff.id, r.staff.name, SUM(case when r.type=1 then 1 else 0 end) AS a, ");
		hql.append("SUM(case when r.type = 0 then 1 else 0 end), r.staff.photo FROM Record r ");
		hql.append("GROUP BY r.staff.id, r.staff.name, r.staff.photo ");
		hql.append("HAVING (SUM(case when r.type=1 then 1 else 0 end) - SUM(case when r.type = 0 then 1 else 0 end)) > 0 ");
		hql.append("ORDER BY  a DESC ");
		
		Query query = session.createQuery(hql.toString());
		query.setMaxResults(10);
		
		@SuppressWarnings("unchecked")
		List<Object[]> list = query.list();
		
		return list;
	}
	
	@Override
	public List<Object[]> findAllDepartReport() {
		
		Session session = factory.getCurrentSession();
		
		StringBuffer hql = new StringBuffer("SELECT	d.id, d.name, SUM(case when r.type=1 then 1 else 0 end), ");
		hql.append("SUM(case when r.type=0 then 1 else 0 end) FROM Record r JOIN r.staff s JOIN s.depart d ");
		hql.append("GROUP BY d.id, d.name");
		
		Query query = session.createQuery(hql.toString());
		
		@SuppressWarnings("unchecked")
		List<Object[]> list = query.list();
		
		return list;
	}
	
	@Override
	public List<Object[]> findAllStaffReport() {
		
		Session session = factory.getCurrentSession();
		
		StringBuffer hql = new StringBuffer("SELECT r.staff.id, r.staff.name, SUM(case when r.type=1 then 1 else 0 end), ");
		hql.append("SUM(case when r.type=0 then 1 else 0 end), r.staff.photo FROM Record r  ");
		hql.append("GROUP BY r.staff.id, r.staff.name, r.staff.photo");
		
		Query query = session.createQuery(hql.toString());
		
		@SuppressWarnings("unchecked")
		List<Object[]> list = query.list();
		
		return list;
	}
	
	@Override
	public Record findRecord(Long id) {
		
		return (Record) factory.getCurrentSession().get(Record.class, id);
	}
	
	@Override
	public void addRecored(Record record) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			record.setDate(new Date(System.currentTimeMillis()));
			session.saveOrUpdate(record);
			
			t.commit();
		} catch (Exception e) {
			t.rollback();
		}
		finally {
			session.close();
		}
		
	}
	
	@Override
	public Record updateRecord(Record record) {
		record.setDate(new Date(System.currentTimeMillis()));
		factory.getCurrentSession().update(record);
		return record;
	}
	
	@Override
	public void deleteRecord(Long id) {
		Record record = (Record) factory.getCurrentSession().load(Record.class, id);
		if(null != record) {
			this.factory.getCurrentSession().delete(record);
		}
	}
}
