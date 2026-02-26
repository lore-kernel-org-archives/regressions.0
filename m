Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070ED436373
	for <regressions@lists.linux.dev>; Thu, 26 Feb 2026 16:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772122894; cv=none; b=n7vDdk75awHkISH7p2tohtfadrX1VBB6VshNwyuPRX0R0iOzmH2J2646YRRZSMPo5Qfz8Po0L81dUc7DRfLn+vrFtRTfo/t155+0O/8DZHQO21POcdaC8NNSjTkQWrenoBX+VwMCeZccX1peqMPmeFZPGnMyq4gUEPzJL7JyxpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772122894; c=relaxed/simple;
	bh=pOav+RWUo+tIL4K3WyminI+GAIz3DxvGhLgbVk6hNqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=flM+L1Uln6kjSyqxlY8/zStYK676o1Kj836Ymao3ROMr5R7xRrTH7DJG09Y7z/E3Ep6ksdJEYvCXYZlYvDRdey4slNorh8ccMktJCx5WJg3eUPH0eAotVaeGAF/kxRfwrC5Exe/dvdR98O2oDr2L3SuHbbsfOycPfizzb3MCavw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kJzJGYbi; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kJzJGYbi"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-389f933034cso4851901fa.2
        for <regressions@lists.linux.dev>; Thu, 26 Feb 2026 08:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772122891; x=1772727691; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9i6OR9L/2JEII0FDOqkHjM/vIFngVooiK7atGXQPLJ0=;
        b=kJzJGYbiv9beBme/+Bhj5+WiT5m7d3tqIUmxjmyWdOrO6sZa/8MreSqw8mCRqlzsb/
         rSw8UsUVZ2gLUJTxT39JEHui2XUJem5EcWVZX7tM3zBRWjT6db4Q2tvdXRUystNGm2PV
         OndW6xHXmmThBJ5W5jLfrXK3+o7vc0mt0hMF2xbByae7+jr+/5RfIfavsY8HQfHivq1k
         1zw3izqDu+IvA3RYC3MBEo2TPJ0UVVFdsHmpzdlR70clmDbI9BlSCkvMbN9a8FLx7tv0
         5KB7a27oDYRcR2yH1IFL8DifqWFvXsntd6BV/S0b/YArqGTpifhuddsKhW6okGbYOSwG
         4A/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772122891; x=1772727691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9i6OR9L/2JEII0FDOqkHjM/vIFngVooiK7atGXQPLJ0=;
        b=ua/It83w/1zjqH9TEF3D0cvu3cctTSv2MpN3vaGjg7KpClv4OKcJSxf83dDubRoRfy
         Y0RAOTDccj6+igsAC5/SfZIH1Uwp84G5uSILVKO5Z9+jC9oKGdjghvUWc14ns+l8AUAY
         VdT1DTTSmBr9qhITrf+87bIk5W02/S4qgHgT8sztUqhL8LRtz1HZlbPomzU/b2G0IYs6
         OOmswaoTo8bbxGyVj1Z1b7X823X+52D/nEQGVCIcbQOjqUpZe/9eiHijrYKn7IGPzMT5
         8GRZnl5vgTpzqlkcKDMVlcm2XxE2vQSYvb4YZiY9t2jjzGnVq0bDYUY6ej58kdYkiIGv
         Hm/A==
X-Forwarded-Encrypted: i=1; AJvYcCXxbo9c4MHXyO3lS/sO9oUn/SnOCwuFp5rq/0PIz6hh+i2DYMfKSMKehrb3DlK4MuwAWXHZof6GPwkTWg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywrvc4SjiDHrZsPm9HPb4w67fMuqCGJq9jE/e43Ci8LEssM5XhK
	6dsXmI8KdgGjItuFuLHXDao0e6avdL0CWT40Sxx9wFDoHS9pU8ElsYER
X-Gm-Gg: ATEYQzyTR2PEv1nirwxqacYbGSe1QrV9eWhDKbksF3WtNnQP0x2EIYQ11zQEWgx+JIs
	RjuU0ZVUzXNnutplVlWIWn2QcIrXO+Iz1SNezZc5yH7fX76nYHEOC3M23Zs+9ZV0kmb6QqUWS2q
	ZSDXlC2nGkwGKbgoQScG+Gyzo/qH3GDwDONI0QWBv3uyCCijdal+CYFSktCZ3B3eme5uGnf3Ggr
	dMniHW0AqQm+bI++bEpIXY+L3YdHDZOKLNTEfWMAAxWa890cHboZ4jd+h6/DZ2pjYMQfhwYVjwH
	nEAHDpaFJCg4OenPZTfKQda29M05sgv03UGGAzKPeev/XD5Wv+wrRQ7QoDTlmCPQBdGk1gWQ8di
	Jvy+50Sw5t2U6DLhzwne4bgkMrupy42XBIfDispbGNVZMOvdblvPqE0NdnWVi2o7V8LlsyWSe1k
	3x2j+gYjuFw3gzI5BdXSoyM9oTi36VnI8FKw==
X-Received: by 2002:a05:651c:4210:b0:388:3d86:473 with SMTP id 38308e7fff4ca-389f2f55ee1mr7937691fa.9.1772122890871;
        Thu, 26 Feb 2026 08:21:30 -0800 (PST)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f2f4b356sm7855121fa.2.2026.02.26.08.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 08:21:26 -0800 (PST)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: harry.yoo@oracle.com
Cc: chris.bainbridge@gmail.com,
	vbabka@suse.cz,
	surenb@google.com,
	dsterba@suse.cz,
	hao.li@linux.dev,
	leitao@debian.org,
	Liam.Howlett@oracle.com,
	zhao1.liu@intel.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-btrfs@vger.kernel.org,
	regressions@lists.linux.dev,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: Re: [REGRESSION] kswapd0: page allocation failure (bisected to "slab: add sheaves to most caches")
Date: Thu, 26 Feb 2026 21:20:52 +0500
Message-ID: <20260226162052.36121-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aZ5aAlDDpUoZxx_g@hyeyoo>
References: <aZ5aAlDDpUoZxx_g@hyeyoo>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, Feb 25, 2026, Harry Yoo <harry.yoo@oracle.com> wrote:
> Slab fix is submitted here, please feel free to test:
>
> https://lore.kernel.org/linux-mm/20260223133322.16705-1-harry.yoo@oracle.com

No page allocation failures after 33 hours of uptime under normal
desktop workload with memory pressure (64GB RAM, btrfs + zram swap,
Chrome with many tabs, AMD GPU).

Previously without this patch, I was seeing failures from both
kswapd0/btrfs and chrome/amdgpu callers within 10 hours.

  Kernel: 7.0.0-rc1 (commit 7dff99b35460 + this patch)
  Hardware: ASUS ROG STRIX B650E-I, AMD Ryzen, 64GB RAM

Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
