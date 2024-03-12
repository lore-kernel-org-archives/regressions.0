Received: from smtp-fw-52005.amazon.com (smtp-fw-52005.amazon.com [52.119.213.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF05A5914E
	for <regressions@lists.linux.dev>; Tue, 12 Mar 2024 19:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.119.213.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710273533; cv=none; b=KZwYKuC97gRNyhQTI7k2cYA1shqxroSREQmouoRk9Z5iLbKuevEUee4EHtdWSCQCb8gIvI9PLO1x33IUNlsmtsaQcFaYMWCvVjUH67Eh5pwR3KHczkpU0KSoOcAAgiqAeWSSDiewMMIS5h56kJuc+OWtI/EBBj6+58vJqAXKKjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710273533; c=relaxed/simple;
	bh=NHW3IaISh50Myyp54DeATRM9ze8PTsnzxTNyx85E6Ck=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sFkFLdpHb64vKFo9AwJnTWJ159y8qvj0j+Gth+Ktk/oYgvM6H53AGS/kJaU5+fm2qcePbn+qsW5TRfGNaY7DKD5hZo9FQOGaOciV7UJWjd135Jei/ht+lvX+/pDjm2JrJiUZUyhhvy9MNcOlNL5gD1c19AxwNCT+RqmZrIzIR5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=ZALj9yj6; arc=none smtp.client-ip=52.119.213.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="ZALj9yj6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1710273532; x=1741809532;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=NHW3IaISh50Myyp54DeATRM9ze8PTsnzxTNyx85E6Ck=;
  b=ZALj9yj69TPE8Ez+8XgxExZakmU3e9T9klGMVFYZUk9PFYN8zVJDtKM8
   SlbEIuI2Uji/ZTPk9qc0lUS0OEi8/T7e2G9Soy8XM1mUCLHsCpM9/0eP0
   eIbulOhickRlpkAg0n8SrKT7S7XKp6jSMaXf8ovpQW2GXeu0UPFiJnPpb
   U=;
X-IronPort-AV: E=Sophos;i="6.07,119,1708387200"; 
   d="scan'208";a="640404346"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-52005.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 19:58:48 +0000
Received: from EX19MTAUEB001.ant.amazon.com [10.0.44.209:21156]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.60.110:2525] with esmtp (Farcaster)
 id 131e9eb3-cf19-4da3-9bbc-00c7e068918e; Tue, 12 Mar 2024 19:58:47 +0000 (UTC)
X-Farcaster-Flow-ID: 131e9eb3-cf19-4da3-9bbc-00c7e068918e
Received: from EX19EXOUEB001.ant.amazon.com (10.252.135.46) by
 EX19MTAUEB001.ant.amazon.com (10.252.135.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 12 Mar 2024 19:58:40 +0000
Received: from EX19MTAUEA001.ant.amazon.com (10.252.134.203) by
 EX19EXOUEB001.ant.amazon.com (10.252.135.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 12 Mar 2024 19:58:40 +0000
Received: from dev-dsk-mngyadam-1c-a2602c62.eu-west-1.amazon.com (10.15.1.225)
 by mail-relay.amazon.com (10.252.134.102) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 12 Mar 2024 19:58:40 +0000
Received: by dev-dsk-mngyadam-1c-a2602c62.eu-west-1.amazon.com (Postfix, from userid 23907357)
	id 2567C7CE; Tue, 12 Mar 2024 20:58:40 +0100 (CET)
From: Mahmoud Adam <mngyadam@amazon.com>
To: <peterz@infradead.org>
CC: <tglx@linutronix.de>, <bp@alien8.de>, <gregkh@linuxfoundation.org>,
	<regressions@lists.linux.dev>
Subject: Regression caused by 'x86/returnthunk: Allow different return thunks'
Date: Tue, 12 Mar 2024 20:58:39 +0100
Message-ID: <lrkyq5xxrz0gg.fsf@dev-dsk-mngyadam-1c-a2602c62.eu-west-1.amazon.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Hello,

 We've seen ~35% regression on fio benchamrk on AMD caused by these
commits:
`
545a94ffc29a4 * x86/alternative: Make custom return thunk unconditional
b012dcf39d9e7 * Revert "x86/alternative: Make custom return thunk unconditional"
1221b8ea25cc8 * x86/returnthunk: Allow different return thunks
`
the finding and bisection was done on v6.1, but the regression is
already seen on the new rebases of other stable kernel 5.10 & 5.15 that
have the same patches.

the following exact fio command that sees this regression:

fio --time_based --name=benchmark --size=50G --runtime=60
--filename=$device --ioengine=psync --randrepeat=0 --iodepth=1
--fsync=64 --invalidate=1 --verify=0 --verify_fatal=0 --blocksize=4k
--group_reporting --rw=randwrite --numjobs=1

note: the regression is seen even with retbleed=off and also with spectre_v2=off

-MNAdam
