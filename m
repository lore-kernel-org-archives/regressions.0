Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4477A73451
	for <regressions@lists.linux.dev>; Tue, 19 Aug 2025 06:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755585722; cv=none; b=rSK5gokT9fiedHvtUhKKwmDEcUmMK+rRHcVLD2O2hLO/kdu7Cx4Hd9GHaKUxSi4iQCJFBQbAa7igaCM3ga3EhgAAHl4FABSppGazseprDdSNiaOxaop8Af+syO2KJ9eO080Vp5KxN5tC4ODrtzyVpTTYDbxb1ydB2sUvVFzsJgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755585722; c=relaxed/simple;
	bh=oVhaykn237IE+sSiBFfDEYwLqYIDFYBWIbK7aE36V9M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RCMiNMNHI/ShnaMYURYXyj2WHJMMsQKZrghCpbI98yh5JVd7toiCPbcrCOkoFHy1tyl5Ucz4XtY75eQCILVQ+Kf/J2gNFhbQr4i5K3we3QUBjGTn9ksFH1U5/S3eD3zOJ52b46SdS5imle+4s2NiQ1yJxb85+au1PiwMdZNuFtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CALpgifp; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CALpgifp"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55ce528a0f5so4946570e87.3
        for <regressions@lists.linux.dev>; Mon, 18 Aug 2025 23:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755585719; x=1756190519; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tl1eWlrDoTfqkIw6nCylIiO1PeyzsPYE6IbWS+8BGLU=;
        b=CALpgifpvsjekhsGUk6XwidVuRgjAFhCcU27oUaNhs2PpHnXL9267fIflGBMl7Ji1M
         pgu5nak/B9atGJASdv0mwo4/BtJF+wBPml4FLPHQ6aHxP/ySaQhjIcxw2ZYEajdYx/ai
         LTdNKZFwNekkBUDxPoIHkZ/khv2aTrX4yySTy1tDG50eScsKWly2lHY/kp64cGNdkaH0
         TKkWG/5u1xRiVEdOY5R3w+8D1GIjDhifb/W8s4p9VdlN/86VClH6enCGmDx0QbEEeLAo
         xRERPA+1rq/l/tRuSA/Ut4h/P/DiUtq18wECKdor5wbNvPoZ5A7a+wtgLJTf/dGKA/Ks
         DnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755585719; x=1756190519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tl1eWlrDoTfqkIw6nCylIiO1PeyzsPYE6IbWS+8BGLU=;
        b=YVAnEjszIrJw98j1JaAeBXHVn6PJXebdVJo65iI1kISbetDiRBnOu2UP698lO6vjq/
         o4sMRjuNwu1nFrizkIAmMKAuJt+0CtZAoi+uFtp1h5zjMdlkQ8IWIWDgPZ+mgUUQQkT1
         qB2jltavMmwPus13xgVS5YCBvHBQIp26bUxNyEh+p8A3TVGC9cpWPwwP2PSwaM7Y+bTd
         EOdm0IKRH28iOnD4YDMpPPefu83DxGCBRJVd5DayKyHPk68Zjdylunyja7JPLM/LRQuR
         Daas7yyEiayRfykVFIGUIB6uXYX2WP/kmVis01/2F4KKtwQK0O/O1NN47rlAgBfWzDUF
         rwnw==
X-Forwarded-Encrypted: i=1; AJvYcCUzFl2fXa7YpmLsNBTfJ7Ip76UC/Dw1m0ZAMiUEdpLRrS66laLqPscnTjR4HS4nBLSgzHKQlM9/0gvXGw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3mnSlf5Mt8RfQP5OPSLCV3u+DqbH/q9Ockj1Hmbf/VUDJFltP
	/9Rza/OPamHx+J4cuw0Sy0XkDL+ZfVs+Pd2nH+qSwC6b2T+FSxyACKn1
X-Gm-Gg: ASbGncvO8ypXq0n3JVEvJzSe/fGh3Iw5hQPNZpKLITC55ucvoU34hvkmh2QLwGPOSlZ
	P/371apXfQ3j3WWlvAUR1Vsbp0qp7GywFQuXSHnhHPsKiGkryiFBMadxwyBQQM2OE5/JqdDjVMy
	ea9mM2V/8rshG9Lqttsb0InQPw03LgSoNcUS5SgW4YwziYIAgRzYAUGpYBcx2YBjFqD2ELoJzjJ
	Ttdt/UDkp/pTx+NjRtKMXIDafK23/5qfMOnCB8k9DwQuoL4trferE7KMpafF2ylwTt+CaKipqJi
	KVvC8YyhLHIubb4VmW4QPnANo2rJMe28tCtRqmsxdr8h8UedufUm+Kpzk4DbSzMo/6l/ymj8KGs
	vowMcfZBude6CsVt/vK5Nqn4+LtYJaAIU6nHujdIHh++scQ==
X-Google-Smtp-Source: AGHT+IEElzTmBQKi8y9DVbV2R/gzGMxaQnK47ySW6v4/t+YPC/5YcZqI+tsKnlyL5G03VhAKgKe1FA==
X-Received: by 2002:a05:6512:b99:b0:55b:8f02:c9e1 with SMTP id 2adb3069b0e04-55e007aa96dmr430802e87.27.1755585718981;
        Mon, 18 Aug 2025 23:41:58 -0700 (PDT)
Received: from foxbook (bfd208.neoplus.adsl.tpnet.pl. [83.28.41.208])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a41ded8sm22906461fa.4.2025.08.18.23.41.57
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 18 Aug 2025 23:41:58 -0700 (PDT)
Date: Tue, 19 Aug 2025 08:41:53 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org
Cc: Niklas Neronin <niklas.neronin@linux.intel.com>,
 regressions@lists.linux.dev, Christian Heusel <christian@heusel.eu>
Subject: Re: [REGRESSION 6.16] xHCI host not responding to stop endpoint
 command after suspend and resume
Message-ID: <20250819084153.2c13c187@foxbook>
In-Reply-To: <20250818231103.672ec7ed@foxbook>
References: <20250818231103.672ec7ed@foxbook>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 18 Aug 2025 23:11:03 +0200, Micha=C5=82 Pecio wrote:
> A bisect effort is ongoing and c0c9379f235d ("Merge tag 'usb-6.16-rc1'
> of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb") is bad,
> so that's where the bug likely came from.

Looks like the result is in.

e1db856bd28891d70008880d7f1d3b8d1ea948fd is the first bad commit
commit e1db856bd28891d70008880d7f1d3b8d1ea948fd
Author: Niklas Neronin <niklas.neronin@linux.intel.com>
Date:   Thu May 15 16:56:14 2025 +0300

    usb: xhci: remove '0' write to write-1-to-clear register
