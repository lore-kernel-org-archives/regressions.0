Received: from smtp-fw-6002.amazon.com (smtp-fw-6002.amazon.com [52.95.49.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A39B382
	for <regressions@lists.linux.dev>; Tue, 12 Mar 2024 21:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.95.49.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710277207; cv=none; b=EcKfLShfdbg6kEHeukLCRv/myLppw3xQq3CjXaJl5JGd0ABzGOj2av9SFci/vxsako0xSctqiNDH7R/kTJkf1USOSWLD2H8w5fJaQXe4g9lm5vOZrw54inPsucqM2ROKGyJJhHpJdAxuZ+H1Q/YB/lpVIeLH/cSe5pKHfpAYqEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710277207; c=relaxed/simple;
	bh=3ox4+r8jsk8IQmGj2tvvu3o+OB7+dNw9bA8HI9xbtK0=;
	h=From:To:CC:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dZZcKMHVDAVPPtphPN+10zrFuoCSWT0DQP5Hf0R/zXjVW3jbIeZfjjx046hYz7yY1LR/zI/P8I8UOjiD8A7NMFmSW+nUfyW2L4GY96+bfXcjW6Jt3b/gQZ2mjmtkN9IXXdum+gmQN6mrc2963bidRDQQjFnT9TkyN3OtwspU2Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=K9pyiCpm; arc=none smtp.client-ip=52.95.49.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="K9pyiCpm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1710277207; x=1741813207;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=3ox4+r8jsk8IQmGj2tvvu3o+OB7+dNw9bA8HI9xbtK0=;
  b=K9pyiCpmqQiYVGbORZ9t3JKy+Y+v7p/cB1VjDbkUDp1Fkt5w+6A4iWsB
   ST3qnDnqhG4OsVpFXycYXkDixWJZXJonc6mafX0Bex76jM0JxFNoIQ0UQ
   UndRBbMpBpal+OHB0o0KVaOTkZ/cBK/eSqDPzQIHpy5c/ECAakHksEQkN
   4=;
X-IronPort-AV: E=Sophos;i="6.07,119,1708387200"; 
   d="scan'208";a="392824154"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-6002.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 21:00:04 +0000
Received: from EX19MTAUWA002.ant.amazon.com [10.0.21.151:13505]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.57.218:2525] with esmtp (Farcaster)
 id 09b0a864-729a-4cd9-b000-218510908bbf; Tue, 12 Mar 2024 21:00:03 +0000 (UTC)
X-Farcaster-Flow-ID: 09b0a864-729a-4cd9-b000-218510908bbf
Received: from EX19EXOUWB001.ant.amazon.com (10.250.64.229) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 12 Mar 2024 21:00:03 +0000
Received: from EX19MTAUWC001.ant.amazon.com (10.250.64.145) by
 EX19EXOUWB001.ant.amazon.com (10.250.64.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 12 Mar 2024 21:00:02 +0000
Received: from dev-dsk-mngyadam-1c-a2602c62.eu-west-1.amazon.com (10.15.1.225)
 by mail-relay.amazon.com (10.250.64.145) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 12 Mar 2024 21:00:02 +0000
Received: by dev-dsk-mngyadam-1c-a2602c62.eu-west-1.amazon.com (Postfix, from userid 23907357)
	id 651522426; Tue, 12 Mar 2024 22:00:02 +0100 (CET)
From: Mahmoud Adam <mngyadam@amazon.com>
To: Borislav Petkov <bp@alien8.de>
CC: <peterz@infradead.org>, <tglx@linutronix.de>,
	<gregkh@linuxfoundation.org>, <regressions@lists.linux.dev>
Subject: Re: Regression caused by 'x86/returnthunk: Allow different return
 thunks'
In-Reply-To: <20240312200239.GIZfC033qDtEUZmwgV@fat_crate.local> (Borislav
	Petkov's message of "Tue, 12 Mar 2024 21:02:39 +0100")
References: <lrkyq5xxrz0gg.fsf@dev-dsk-mngyadam-1c-a2602c62.eu-west-1.amazon.com>
	<20240312200239.GIZfC033qDtEUZmwgV@fat_crate.local>
Date: Tue, 12 Mar 2024 22:00:02 +0100
Message-ID: <lrkyq1q8fyxm5.fsf@dev-dsk-mngyadam-1c-a2602c62.eu-west-1.amazon.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Borislav Petkov <bp@alien8.de> writes:

> On Tue, Mar 12, 2024 at 08:58:39PM +0100, Mahmoud Adam wrote:
>> note: the regression is seen even with retbleed=off and also with spectre_v2=off
>
> Try with spec_rstack_overflow=off or mitigations=off.

No regression with these cases.

-MNAdam
