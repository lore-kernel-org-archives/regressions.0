Received: from smtp-fw-9106.amazon.com (smtp-fw-9106.amazon.com [207.171.188.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF378142636
	for <regressions@lists.linux.dev>; Tue, 12 Mar 2024 21:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.171.188.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710279205; cv=none; b=bLqW7dmm8EU0diWI6drvhum7x6zzZQIM6CII5d/8UMqlLxlYl72t4epI0djOs2TPVv/g/41/cKu6hxnA/QUBrwmn2c8MNgVpbFUA3lIJ47CBZDkge/wcCeDT/DxNiq60XuiGjWk8ZMxbllDWwZFacSjQNl1lRpR7vs3gwjKs23s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710279205; c=relaxed/simple;
	bh=EUuPSFfdmqyoR3U3fdsWz6e0GT+Ka7/HLmVbMxpGYVY=;
	h=From:To:CC:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nrXQUovgC8bfKP40U5HHRhlaIQ/B0Ymovio2XsgVdjaL/xX/IjHh7PhXdvPc0WgMamgPKXlYUS2ehvU1ZTg6NedB3/CUtsPxzdyXEJNigvFuc5skY3TQDk19KJj9u9edgLUxxFrWaOiCUSnkcf0S6hdjhWFGvx1sL9fuEr/ZD8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=BiL7nl6l; arc=none smtp.client-ip=207.171.188.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="BiL7nl6l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1710279204; x=1741815204;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=jXjUhhJKF0aKoa78caFmQO65lBCY+UgJ5ztOV00QhF8=;
  b=BiL7nl6lNA4Cyt7Rhx7+PVzIxA7h96nnSYTG3fSO3DBHvahwOm8O0vCm
   qo1rnir7ySmj8gtb58MCu4xxBnXFuhhXJDM1kU74OsbDz2oZy12Dybq/S
   AATo9QY28docdO6JJsaz73ufUsdbcn1gG//Uivc/LyEr7qDrvi6Oj0xII
   s=;
X-IronPort-AV: E=Sophos;i="6.07,119,1708387200"; 
   d="scan'208";a="710557332"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-9106.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 21:33:18 +0000
Received: from EX19MTAUEC002.ant.amazon.com [10.0.0.204:41918]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.85.77:2525] with esmtp (Farcaster)
 id f59797f5-07ab-4cf8-be87-7338a4fb8c58; Tue, 12 Mar 2024 21:33:17 +0000 (UTC)
X-Farcaster-Flow-ID: f59797f5-07ab-4cf8-be87-7338a4fb8c58
Received: from EX19EXOUEC001.ant.amazon.com (10.252.135.173) by
 EX19MTAUEC002.ant.amazon.com (10.252.135.253) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 12 Mar 2024 21:33:17 +0000
Received: from EX19MTAUEC001.ant.amazon.com (10.252.135.222) by
 EX19EXOUEC001.ant.amazon.com (10.252.135.173) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 12 Mar 2024 21:33:17 +0000
Received: from dev-dsk-mngyadam-1c-a2602c62.eu-west-1.amazon.com (10.15.1.225)
 by mail-relay.amazon.com (10.252.135.200) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 12 Mar 2024 21:33:17 +0000
Received: by dev-dsk-mngyadam-1c-a2602c62.eu-west-1.amazon.com (Postfix, from userid 23907357)
	id D6C742426; Tue, 12 Mar 2024 22:33:16 +0100 (CET)
From: Mahmoud Adam <mngyadam@amazon.com>
To: Borislav Petkov <bp@alien8.de>
CC: <peterz@infradead.org>, <tglx@linutronix.de>,
	<gregkh@linuxfoundation.org>, <regressions@lists.linux.dev>
Subject: Re: Regression caused by 'x86/returnthunk: Allow different return
 thunks'
In-Reply-To: <20240312210449.GKZfDDcQiclOTXBSB1@fat_crate.local> (Borislav
	Petkov's message of "Tue, 12 Mar 2024 22:04:49 +0100")
References: <lrkyq5xxrz0gg.fsf@dev-dsk-mngyadam-1c-a2602c62.eu-west-1.amazon.com>
	<20240312200239.GIZfC033qDtEUZmwgV@fat_crate.local>
	<lrkyq1q8fyxm5.fsf@dev-dsk-mngyadam-1c-a2602c62.eu-west-1.amazon.com>
	<20240312210449.GKZfDDcQiclOTXBSB1@fat_crate.local>
Date: Tue, 12 Mar 2024 22:33:16 +0100
Message-ID: <lrkyqttlbxhib.fsf@dev-dsk-mngyadam-1c-a2602c62.eu-west-1.amazon.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Borislav Petkov <bp@alien8.de> writes:

> On Tue, Mar 12, 2024 at 10:00:02PM +0100, Mahmoud Adam wrote:
>> Borislav Petkov <bp@alien8.de> writes:
>> 
>> > On Tue, Mar 12, 2024 at 08:58:39PM +0100, Mahmoud Adam wrote:
>> >> note: the regression is seen even with retbleed=off and also with spectre_v2=off
>> >
>> > Try with spec_rstack_overflow=off or mitigations=off.
>> 
>> No regression with these cases.
>
> Works as advertized then. :-)

Can you elaborate more please, From what I understand from
`x86/returnthunk: Allow different return thunks` it's a preparation for
call depth tracking on SKL, why is this expected to add regression?


Thanks,
MNAdam
