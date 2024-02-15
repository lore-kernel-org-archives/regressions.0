Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D4258ABC
	for <regressions@lists.linux.dev>; Thu, 15 Feb 2024 13:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708004458; cv=none; b=rBz3/XPn7VkPehhkRnmY0b1rOvAPUcq+Sg8Ksol2RO/NrdJKmwiFyfqZNc95pSXTkPMSLj08KpTT2Fe8ZehVZzQ40N3OU6L1wvuLQhc6t0XMTQsnT+aASS0tNaEjrscOYOobjSsaB5h/fnTE0GNnqxmlY8isxF4KfiTlfRXqpo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708004458; c=relaxed/simple;
	bh=plKKOsjcVDNC3BZf+gPr1nfSPGe/mslre9dzGeiehf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dtOr6Xs35iU1IpwRn03Yi0X+4mg9z+Xo4XajeEX7u66M5sp3OqCrcIjbwnYSn9y4SGhT17GQPtrNeVMeT3EJYNmQ4YDMbWb0pPiLqgyaqWLG+d6Mg8DIeI1neQhdBKz6o8W2Vd5FDOV1O8igyNhnkoAn88TYEhSPIh0y0FVKZBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b8JSHTFv; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b8JSHTFv"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6e0f5934813so704885b3a.2
        for <regressions@lists.linux.dev>; Thu, 15 Feb 2024 05:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708004456; x=1708609256; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bkr+xueP4b0KmB4knxFyYBugl4UyONHoxgCWkkPTCIM=;
        b=b8JSHTFvxzxvIiaPCXt2nVjz11BCaCU3Bw0GcYtaP/IYYd4wC5mPq5Q6G34S8IGJzx
         LpkrVRk6yEU8+B5bwJxBlC4QB4BGpDtXmYMoX2YBhzBBeARiCq8R+pBTVbzPETNLIWsF
         DoX16A0FQ8Ph0+FRD3czoJ61JEAo6sYbO3fxv6yFkdZB2TPk7jN44q/99g99CfpvQS3X
         C8uRw2iGw+5ZAyTXx4ng6ukKN8CEE4cdN4p4GUdK/OxAukpmQF/Wd4/Bj02KghwNxp4z
         GQqst+1XgdAKOyiipTxcszYCYHymDWyqvtOV8PAmZcJ5BoRzbIEhqzEDeAv1jTPk472r
         wIbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708004456; x=1708609256;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bkr+xueP4b0KmB4knxFyYBugl4UyONHoxgCWkkPTCIM=;
        b=kElA1UkbUgeTdFzcANAg2Tfc3IfqsbO8+xcJA3rjwdbb9Ki9v6OVOJD8zoXZPM0XN8
         xJNoOV/ca0SXKHYi4KbRaVGUHHDpsM2JQWcfk/pB50qMx888s1I+bSNXv+dPRobhgNFE
         5oYgr++SFXKrXAjGO7JkL1cQblMn04ZjMKwEzbmaE3h6fC/Ij4ReMPVn4VhPFbO4jwR+
         04a+SMSwePkQkbj2aXSAACibVIZk/d6SiM1sCf/nDGSlkxu5JyXL9WqVBhvyk5inoNCY
         XneStogo1Q54SyIf/nJXcxjzDU6NLm7AZ9RWNceUkSOHF7mioEMbKhuVmaG/ZtG7BPp/
         9Jog==
X-Forwarded-Encrypted: i=1; AJvYcCU6u/xNWqBSsh425Ya+lKxTxbeDrnSG5pwM3A7Z0e3XCAPmtpvUOsHysXrlWOQZ9CMitM0VgGj4eFoqF/3xJGNUQH+1tZ9Jf0vAgP4=
X-Gm-Message-State: AOJu0Yxbw0ywTRYCB8FP2Wspp0QehNDQtLfPRa5M12nFPfmkkx4FCRuw
	yBKyWGOhYnSWCXA0dAu94qldq9UbXoeRZmJi5YzebExWEzL2NUdY
X-Google-Smtp-Source: AGHT+IFOy2oAuCsimSjUTlr+FbniAH8S3avp/Dtgyo3OSqiCb9v+fahkpPjDWs3p/Yh7HVqq7/EWew==
X-Received: by 2002:a05:6a21:626:b0:19e:ac67:13a9 with SMTP id ll38-20020a056a21062600b0019eac6713a9mr1797607pzb.19.1708004456148;
        Thu, 15 Feb 2024 05:40:56 -0800 (PST)
Received: from localhost ([2620:10d:c090:400::4:fe87])
        by smtp.gmail.com with ESMTPSA id jb19-20020a170903259300b001db43f3629dsm1267283plb.140.2024.02.15.05.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 05:40:55 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
Date: Thu, 15 Feb 2024 03:40:54 -1000
From: Tejun Heo <tj@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>,
	Linux-Next Mailing List <linux-next@vger.kernel.org>,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: next-20240215: workqueue.c: undefined reference to
 `irq_work_queue_on'
Message-ID: <Zc4UZkFp6Jr051gE@slm.duckdns.org>
References: <CA+G9fYuHF34bSbN9ktKuMAv1eOFVrf+Gw1MC_rG5trUQv9A_Pw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYuHF34bSbN9ktKuMAv1eOFVrf+Gw1MC_rG5trUQv9A_Pw@mail.gmail.com>

Hello,

Can you see whether the following patch fixes the build?

diff --git a/init/Kconfig b/init/Kconfig
index 8df18f3a9748..41be05a8ba5e 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -107,6 +107,8 @@ config CONSTRUCTORS
 
 config IRQ_WORK
 	bool
+	depends on SMP
+	default y
 
 config BUILDTIME_TABLE_SORT
 	bool
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 04e35dbe6799..6ae441e13804 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -1209,6 +1209,20 @@ static struct irq_work *bh_pool_irq_work(struct worker_pool *pool)
 	return &per_cpu(bh_pool_irq_works, pool->cpu)[high];
 }
 
+static void kick_bh_pool(struct worker_pool *pool)
+{
+#ifdef CONFIG_SMP
+	if (unlikely(pool->cpu != smp_processor_id())) {
+		irq_work_queue_on(bh_pool_irq_work(pool), pool->cpu);
+		return;
+	}
+#endif
+	if (pool->attrs->nice == HIGHPRI_NICE_LEVEL)
+		raise_softirq_irqoff(HI_SOFTIRQ);
+	else
+		raise_softirq_irqoff(TASKLET_SOFTIRQ);
+}
+
 /**
  * kick_pool - wake up an idle worker if necessary
  * @pool: pool to kick
@@ -1227,15 +1241,7 @@ static bool kick_pool(struct worker_pool *pool)
 		return false;
 
 	if (pool->flags & POOL_BH) {
-		if (likely(pool->cpu == smp_processor_id())) {
-			if (pool->attrs->nice == HIGHPRI_NICE_LEVEL)
-				raise_softirq_irqoff(HI_SOFTIRQ);
-			else
-				raise_softirq_irqoff(TASKLET_SOFTIRQ);
-		} else {
-			irq_work_queue_on(bh_pool_irq_work(pool), pool->cpu);
-		}
-
+		kick_bh_pool(pool);
 		return true;
 	}
 
