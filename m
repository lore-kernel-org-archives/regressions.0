Received: from mail.581238.xyz (86-95-37-93.fixed.kpn.net [86.95.37.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6E7199938
	for <regressions@lists.linux.dev>; Tue, 22 Oct 2024 12:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=86.95.37.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729599220; cv=none; b=sX3RibwgVu62k6/YV0yYBht576J0IQQKTpql5r557MlD7mSDHrO9C6N5yYoN8npWr2yLVdOBdXH/RAKWLqhgOI6a+fHbkdQMRbahvuzaoQG6udaXH1fmkhMwC+mqCa9uPy2mumW0OqWV9aVplH0EqU/KvpbqrpGycNpP8iQwQ8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729599220; c=relaxed/simple;
	bh=lCky3Di3m4lYMAlpEuMx18kgHzOCT36dhjVGA5GWJ/Y=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=GNtQxSAtK3IaFTvQGPySziEgUR9KO6a8mShGFDzpJdRb/tvgbARt5cNr4NPPrJaTrqwkuPBr9SyOfJxMD+iCYbY1WJ+1bjZxtNNjsyWLThYmSOu92J1+Z9ddvOZEVGy/b/u6q/estVntBmcFFmNaqi0HABuU0kXu8HNQDza63bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=581238.xyz; spf=pass smtp.mailfrom=581238.xyz; dkim=pass (1024-bit key) header.d=581238.xyz header.i=@581238.xyz header.b=bJb+vR+c; arc=none smtp.client-ip=86.95.37.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=581238.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=581238.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=581238.xyz header.i=@581238.xyz header.b="bJb+vR+c"
Received: from PC (pc.internal [192.168.1.10])
	by mail.581238.xyz (Postfix) with ESMTPSA id 89A5543088FB;
	Tue, 22 Oct 2024 14:13:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=581238.xyz; s=dkim;
	t=1729599214; bh=lCky3Di3m4lYMAlpEuMx18kgHzOCT36dhjVGA5GWJ/Y=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date;
	b=bJb+vR+cquFV4dAEemyokErGy4PwyUI1t+YXwzxAz0ZMO9qf12qPIDnCs0UvgFojR
	 1HPucDlGNLCGntytURaFXucAy8g4wB8EVsYkTBFWthH8+BdDASuZNVQsDlJjfVGmbG
	 3aqiS4up8z2PNHwh0N1qFsMrAeYPu4LZReXSwPZM=
From: <rick@581238.xyz>
To: <mika.westerberg@linux.intel.com>
Cc: <Sanath.S@amd.com>,
	<christian@heusel.eu>,
	<fabian@fstab.de>,
	<gregkh@linuxfoundation.org>,
	<linux-usb@vger.kernel.org>,
	<mario.limonciello@amd.com>,
	<regressions@lists.linux.dev>,
	<stable@vger.kernel.org>
References: 
In-Reply-To: 
Subject: Re: Dell WD19TB Thunderbolt Dock not working with kernel > 6.6.28-1
Date: Tue, 22 Oct 2024 14:13:34 +0200
Message-ID: <000f01db247b$d10e1520$732a3f60$@581238.xyz>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Adske5XwB29EbUf4QzmLPMDmlYiH4Q==
Content-Language: en-gb

Hi all,

I am having the exact same issue.=20

linux-lts-6.6.28-1 works, anything above doesn=92t.

When kernel above linux-lts-6.6.28-1:
- Boltctl does not show anything
- thunderbolt.host_reset=3D0 had no impact
- triggers following errors:
  [=A0=A0 50.627948] ucsi_acpi USBC000:00: unknown error 0
  [=A0=A0 50.627957] ucsi_acpi USBC000:00: UCSI_GET_PDOS failed (-5)

Gists:
- https://gist.github.com/ricklahaye/83695df8c8273c30d2403da97a353e15 =
dmesg
with =93Linux system 6.11.4-arch1-1 #1 SMP PREEMPT_DYNAMIC Thu, 17 Oct =
2024
20:53:41 +0000 x86_64 GNU/Linux=94 where thunderbolt dock does not work
- https://gist.github.com/ricklahaye/79e4040abcd368524633e86addec1833 =
dmesg
with =93Linux system 6.6.28-1-lts #1 SMP PREEMPT_DYNAMIC Wed, 17 Apr =
2024
10:11:09 +0000 x86_64 GNU/Linux=94 where thunderbolt does work
- https://gist.github.com/ricklahaye/c9a7b4a7eeba5e7900194eecf9fce454
boltctl with =93Linux system 6.6.28-1-lts #1 SMP PREEMPT_DYNAMIC Wed, 17 =
Apr
2024 10:11:09 +0000 x86_64 GNU/Linux=94 where thunderbolt does work


Kind regards,
Rick

Ps: sorry for resend; this time with plain text format


