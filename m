Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946162571AA
	for <regressions@lists.linux.dev>; Mon, 21 Apr 2025 04:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745209598; cv=none; b=BJnQMt8w9khts0nRYuwM4c9/upwXHdPVmghs/mQtRSKJf/Tukgt0ndQfOmRuBziSDBbsvtFD9evVXvIFQ777cq56S51TAEYV+UfayTLqdtQtmhlGWwWUuwBT8TV1UWzE14g00q/+YgYY+aU36w/QiDGhmE0us1r68WzgEUMP3rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745209598; c=relaxed/simple;
	bh=d1uH2WOYbfu8vP+fnv2qaV3rjRXrD49f0j0Rv92vBUY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sPoi0DBdfnOFhiuVOKaRBJgJEcvnfWP3BEuSfEASWZAJ7Ws9hBlhfZw5PZUzSq1MxL7fJY6nH7Ap3To+z4MuHebyH2wavn1QwSerDbv/sJzwn+mMlTemJS8bA8YhfOKpHJsCU3Cu7/F8soArCFsNXps1a6V6ggBs7VtHaQWBbqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=xesteNmN; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="xesteNmN"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c559b3eb0bso194451485a.1
        for <regressions@lists.linux.dev>; Sun, 20 Apr 2025 21:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1745209595; x=1745814395; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qLXMwjq74bNK6BOfgJ7phL0lyY08ZAolUu+OAsiQ9to=;
        b=xesteNmNcK7bp8PH4M+tOU8Oazf85fHzmpc8ZJSHEUUgzx0hPgECZVA7igBM2nvH/d
         3sRlSpS7soq8spUijUobzfu+rYzaPlJsP7u4LVXVQWuMiV9HNZVrXblxdVH7griPb2vS
         NRqkewJRVLK3omzZVR4ya9GgxUoUwAM+QjZszfz5Al8yC7wXreHtrGUPoQsrUlfhH64O
         N1PCI8F75utQIwF4M+NKZdlo4qajI1NEya9aCqB6dDj5pTUCYG3SHBkZA7tmyu4Lqq2g
         OY7GkgXu+GR2Kddxc57vbUQ2vHQcpNhpiJ40C25SAm/9FX9wghE5RuLV//LYv2aUGKjr
         7bDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745209595; x=1745814395;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qLXMwjq74bNK6BOfgJ7phL0lyY08ZAolUu+OAsiQ9to=;
        b=oZxFf1Ka55bRn6t0zHIU3jpqlW6dODBgGiC1cIaTbO394SLlcV0ZI/JrP2AZeLiYR/
         DSjRP1G80pesB9oNeNM4EWAlYBig5MAx+Wa5CxzR60+86Y0TyHl9Jw9P1jnXzkVLOK9A
         4ASmXJ6ff7wjjQxzIAiiYReUHg4QWWq1RI9umfgZMj+hQhVfPmz4WuFX5eCq3AAjdOiP
         X7PxjC/5AFpTWLF0g60n4qdOP3b+0W0+jz1DWQ/XRolEMbu5n/dTRqb53jt2whj/uFCL
         ob38p+/X+sl7hS6wjv/v28JaioFS8CEDOnJq4G9QGoYW6H0myyGMpqQBbosL3sSbWAJT
         2DGA==
X-Forwarded-Encrypted: i=1; AJvYcCXD4nNoBFpBeQ4fr2Z/bZwQMDStfwBNGop0a1jSZOJoNKyOek0P3y9erg1F3SBTmhd6lf6fYuAl/xAqkQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzPtHoCCqYZVLXgQxSCdHGGvqsDMnYwzlVuVvAsdjDrhSYSb3+I
	DwjyWvr7F1DxVl3s74vpBe9b2ekRLoXzwVU6e6BWIJj5YehsZIZWkDUFGAd+KAs=
X-Gm-Gg: ASbGncspYaPLVzKauzQoRXQSKWuzL9Sjb9uY+GoQAqYlhilA2u4BtIcgeTqmIO/VYZ1
	7mk/BKtM3bN3IpokkPIvh6Ek6EcF0pGLCNE6jLW1iDlnG1VwFZDFvixciJckGEP2g9ZtmWaL2UH
	2A/0k1Zjl9fcc4HjxMxBz5yT2cEnkLg1T/vsplVKWkjjWwgAWgiSoSBkh1CnDtiHNN7uLiZvkG/
	tKnCfyz0tR/rYtymxZ8Mvfbv/A95h8Qyj4EzQGzabmGOh8BeWvaWr0UFpYq6ywlNSBPO5zJ046k
	hFwTDYUAO2JgkrC2ImWmPneqkqfHFC5tt+x+eEyT2JFNsiArvHwT4wptmTHdgggpXxTyVQ==
X-Google-Smtp-Source: AGHT+IH3TnmhAg1TTlz4bLDFMIRiDBWG/0r9tsSd+aOYXwB1Hw87ZxRvl3foghRcH3dPlVidUnuInA==
X-Received: by 2002:a05:620a:1a89:b0:7c5:3d60:7f88 with SMTP id af79cd13be357-7c927f776d0mr1265005885a.16.1745209595407;
        Sun, 20 Apr 2025 21:26:35 -0700 (PDT)
Received: from localhost (ip-24-156-181-135.user.start.ca. [24.156.181.135])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925b4dc09sm380262485a.73.2025.04.20.21.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 21:26:35 -0700 (PDT)
Date: Mon, 21 Apr 2025 00:26:33 -0400
From: Nick Bowler <nbowler@draconx.ca>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	regressions@lists.linux.dev
Cc: Douglas Anderson <dianders@chromium.org>
Subject: PROBLEM: AST2500 BMC video output disabled by reboot (regression)
Message-ID: <wpwd7rit6t4mnu6kdqbtsnk5bhftgslio6e2jgkz6kgw6cuvvr@xbfswsczfqsi>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I recently noticed that on current kernels I lose video output from
my Blackbird's AST2500 BMC after a reboot, which makes it difficult to
boot the system again (the video output will come on only after Linux
is booted again).

With Linux 6.6 and earlier, there is no problem rebooting, everything
is fine.

I bisected to this commit:

  ce3d99c8349584bc0fbe1e21918a3ea1155343aa is the first bad commit
  commit ce3d99c8349584bc0fbe1e21918a3ea1155343aa
  Author: Douglas Anderson <dianders@chromium.org>
  Date:   Fri Sep 1 16:39:53 2023 -0700

      drm: Call drm_atomic_helper_shutdown() at shutdown time for misc drivers

This commit does not revert cleanly on 6.14, but I can easily undo
the changes this commit made to the ast driver, and this is enough
to restore working behaviour.

Let me know if you need any more info!

Thanks,
  Nick
