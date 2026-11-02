-- Preserve the planning access that current administrators previously received by role.
-- Future grants and revocations are controlled per user, including administrators.
UPDATE USUARIO SET PODE_CRIAR_PLANEJAMENTO=TRUE,PODE_EDITAR_PLANEJAMENTO=TRUE WHERE ROLE='ADMIN';
