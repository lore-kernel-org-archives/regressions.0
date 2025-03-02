Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0513A1E5B9C
	for <regressions@lists.linux.dev>; Sun,  2 Mar 2025 16:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740931433; cv=none; b=gVMfQlvIyc23/bP6G6uTMwPHtQcfbBIgnH3qS+iylb/xdUYlP3/9PfRUJNxASiXowmFbALOpq6ebhSSsb4PRhJxklAP1Yu0nEaCZ2dTVPYwD8OP8q0tr5hkzypLMdR/qZwElT3yaJVPlC7NPaL4p9PHoweNK8gDXgF+slu1/Vyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740931433; c=relaxed/simple;
	bh=PpoiA7zcL5siK6dUoXkSOW7sxsC4plRQ9I9AThPDGb4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qP9o9E6bzInFTFtMLT4zwRttdFSeZ/RxJiHkHWLK6D7h6YzKKncCCRq+8mEP6XFVZ66XW28ZAf2aApOexs58L7O3I0mRdKlFkw3oc3hS8mqkxa2WWSvCoCIvdDI2R8jjmsDbbZx5pSACMquWv7T9bPO2UjKQ3sVOi3Vi+8AYhdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hbh4YRJc; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hbh4YRJc"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e4f5cc3172so3441518a12.0
        for <regressions@lists.linux.dev>; Sun, 02 Mar 2025 08:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740931430; x=1741536230; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=KqMUvt/Ij4ONg3Ys/j5SSJwq5McLd1u+T3IXK69/iY0=;
        b=hbh4YRJcHcWq88OvvjFSdg3kXaHrN6RfRhWl05m4+h46/MmEh/yi2OFTzfiucCCOUL
         2QjUNcS5hMPfUkoMoxJjipSRPSR0n3894Bmudx74O3P7oAULYlkJHPEZ46iPkH+kbryC
         gOVS87LcJ1HreA6CbHYyQy6t6o+AC3qZnskmQtRq8GnPbzVEvgKtn3mBvZHL6s/r34FZ
         xsnU27GfrfzVXWsket19fQEL3tvY9L0qSDsLbtcyskTur2zv2w50GSnBCxya3e/LISQI
         m9XzJuQGPCR6MkMqx5BB1g9NiHWmTEyQ+zFy8yqKHb2GnWlt6ZoJjmYtW6AVlYy4zQWw
         8qCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740931430; x=1741536230;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KqMUvt/Ij4ONg3Ys/j5SSJwq5McLd1u+T3IXK69/iY0=;
        b=VWRTvM+ndC0LFsz7QE5Izu/1aDZkzjlu2nWdPbC1k4WzPGP8kP5e54tKKjo3KSGsGP
         jL6WbBtTYJmyxuUcAMgfzkzRMs8sq7nCju+rbN9gU8qzarh0I6pCCFaxqLYPsV3AN0K1
         xttkQwCLK5Enlvzy+1LxNDVCvqQdkH/Je9fX+xoakF2+MKXgsKa7f8rks78Io6RYBtK1
         3RX+0zvZVi1u+vOw4rPXqmx+pgTHAI37PRJQKaEYLVUpUl4sEZmiiE31aJMM/41+vHjx
         /S48grqb97PQnPSWzITdTBNSpkBI8vomzzb2H+pJzpa1Oqtb3wV9mJxeQMHp4ZDfHwvR
         hDAA==
X-Gm-Message-State: AOJu0Yy3V7lBAwLWA088lVtz1MrgF+WpJxF+uYg4d5DaxnUP+hS05EQd
	lUahJzJuZa7GtnuOPFRFSTc8xb3JaJx6haeGh2Qu0dkAKuEBwH42
X-Gm-Gg: ASbGncusrtGgeCaUbr+QtqmExI7GnmOP6TsoDmNyYQG2ExsUoPIyx81BZ8kk1TgpsxD
	9Um4eT0S7UsPNbxIA6nxkUxBKGO7QGTDmwrtPTYxqSbx37tqsVScCIxxTOA0Yd/PLeuIAXeuSIh
	vuk5tjRPuFZ+u/hfxAwpzuotMO82+r+nIpC5E2oa37Ci9XAQQoBBsKo4awlAQmS0UsZLGtz3Gu6
	49QAQy9xDq2BNnYPuUUsdzbPZMwNUTWbpr83Q+QZ8LnE/SsC7qkSo4pUlk99qjzej8Tt/9ip5Ji
	gXEOh1vIzHwYZhL1VmQB6jx8zvb6bSAgS0EH+bhDj4tjZMngRy7RQBsGXJ1vFxXEEGhHvrorlh7
	ygg==
X-Google-Smtp-Source: AGHT+IFWXl0EDKxgBsDCDLhNQV3+yBJQ0X9U1IHYqXyA4xxGqEq/sAuqyM6Oe7BG4J2BsNkWYT1QVg==
X-Received: by 2002:a05:6402:520f:b0:5e0:9254:c10e with SMTP id 4fb4d7f45d1cf-5e4d6ad85famr11127566a12.11.1740931429973;
        Sun, 02 Mar 2025 08:03:49 -0800 (PST)
Received: from eldamar.lan (c-82-192-244-13.customer.ggaweb.ch. [82.192.244.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb5927sm5564238a12.53.2025.03.02.08.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 08:03:49 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id A74BCBE2DE0; Sun, 02 Mar 2025 17:03:48 +0100 (CET)
Date: Sun, 2 Mar 2025 17:03:48 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Mario Limonciello <mario.limonciello@amd.com>,
	Niklas Cassel <cassel@kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Jian-Hong Pan <jhp@endlessos.org>,
	Eric Degenetais <eric.4.debian@grabatoulnz.fr>
Cc: regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, linux-ide@vger.kernel.org
Subject: Regression from 7627a0edef54 ("ata: ahci: Drop low power policy
 board type") on reboot (but not cold boot)
Message-ID: <Z8SBZMBjvVXA7OAK@eldamar.lan>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mario et al,

Eric Degenetais reported in Debian (cf. https://bugs.debian.org/1091696) for
his report, that after 7627a0edef54 ("ata: ahci: Drop low power policy  board
type") rebooting the system fails (but system boots fine if cold booted).

His report mentions that the SSD is not seen on warm reboots anymore.

Does this ring some bell which might be caused by the above bisected[1] commit?

#regzbot introduced: 7627a0edef54
#regzbot link: https://bugs.debian.org/1091696

What information to you could be helpful to identify the problem?

Regards,
Salvatore

 [1] https://bugs.debian.org/1091696#10
