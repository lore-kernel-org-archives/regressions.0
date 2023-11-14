Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BE1BA31
	for <regressions@lists.linux.dev>; Tue, 14 Nov 2023 04:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=raptorengineering.com header.i=@raptorengineering.com header.b="HQNxYyf7"
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id F3B0982854A4;
	Mon, 13 Nov 2023 22:56:11 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id k6YoQvOytnOq; Mon, 13 Nov 2023 22:56:10 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id ADDC4828556E;
	Mon, 13 Nov 2023 22:56:10 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com ADDC4828556E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1699937770; bh=suyxsTRgUHoTupfIsnXMRC4HT7HeuMOWgcutMPwBqoI=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=HQNxYyf7xD52FsOAkodS0rCnGJh26Z8HHCDGhJEAn1QJxOwXgcXgTaIqJYBI4MgEH
	 DsU6rBq/I1/WmpeTTcesIIzaOtG+XK1Kv9t/Pl5fhpoi3WvvAUbhNdCfFLCda48/Bo
	 0jZ8142HRiuPODvFqgAQPv4z1TcQnYSO1Q626FKc=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 1aqGhMfcfZ-Z; Mon, 13 Nov 2023 22:56:10 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 843AB82854A4;
	Mon, 13 Nov 2023 22:56:10 -0600 (CST)
Date: Mon, 13 Nov 2023 22:56:09 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: 
	Linuxppc-dev <linuxppc-dev-bounces+tpearson=raptorengineering.com@lists.ozlabs.org>, 
	Jens Axboe <axboe@kernel.dk>, 
	regressions <regressions@lists.linux.dev>, mpe@ellerman.id.au, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu
Message-ID: <19221908.47168775.1699937769845.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH] powerpc: Fix data corruption on IPI
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC119 (Linux)/8.5.0_GA_3042)
Thread-Index: rJNeKWKwjG5Byc4tlORSDG+9MSN50g==
Thread-Topic: powerpc: Fix data corruption on IPI

From 0b2678b7cdada1a3d9aec8626f31a988d81373fa Mon Sep 17 00:00:00 2001
From: Timothy Pearson <tpearson@raptorengineering.com>
Date: Mon, 13 Nov 2023 22:42:58 -0600
Subject: [PATCH] powerpc: Fix data corruption on IPI

On multithreaded SMP workloads such as those using io_uring, it is possible for
multiple threads to hold an inconsistent view of system memory when an IPI is
issued.  This in turn leads to userspace memory corruption with varying degrees
of probability based on workload and inter-thread timing.

io_uring provokes this bug by its use of TWA_SIGNAL during thread creation,
which is especially noticeable as significant userspace data corruption with
certain workloads such as MariaDB (bug MDEV-30728).  While using
TWA_SIGNAL_NO_IPI works around the corruption, no other architecture requires
this workaround.

Issue an lwsync barrier instruction prior to sending the IPI.  This ensures
the receiving CPU has a consistent view of system memory, in line with other
architectures.

Tested under QEMU in kvm mode, running on a Talos II workstation with dual
POWER9 DD2.2 CPUs.

Tested-by: Timothy Pearson <tpearson@raptorengineering.com>
Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 arch/powerpc/kernel/smp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index ab691c89d787..ba42238de518 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -369,8 +369,10 @@ static inline void do_message_pass(int cpu, int msg)
 
 void arch_smp_send_reschedule(int cpu)
 {
-	if (likely(smp_ops))
+	if (likely(smp_ops)) {
+		__smp_lwsync();
 		do_message_pass(cpu, PPC_MSG_RESCHEDULE);
+	}
 }
 EXPORT_SYMBOL_GPL(arch_smp_send_reschedule);
 
-- 
2.39.2

