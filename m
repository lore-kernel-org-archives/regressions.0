Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A4E14E2C0
	for <regressions@lists.linux.dev>; Mon, 18 Nov 2024 22:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731969478; cv=none; b=YO6MYE/VO+LY9xkoG3p2Gtd20XuB0FGOWZOPd5GNcSj05JOcTevkkFHFdNF4SOG1gv3B+nSPw099Uxlts61NFDY6pExRY/imU0BxGQZi3zl+lqx0nk6OEUHnKfLYkmQPcJ1W4eyOefkdF/tzAcqVtNOD1Pv+zDMmtDBIj/Cd+rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731969478; c=relaxed/simple;
	bh=mqk98GP19dZ+Ay7HEP68kLZER2bT/NkIqYTu8jMJ4BE=;
	h=From:Message-ID:To:Subject:Date:MIME-Version:Content-Type; b=Kqn66ifv9s4d9o0a9s8W+lNnh5ofFnNAtO/pczZGiv67xVJsu64Spc9sN+L7jcvMIC+kCqMIxPePgr+DcLdFuvzgHjD5AexVbe+FShAOX5+7d1s+POxIRQp5wd2r15owLuW2mMyIBcJrluIp69Jt6Olesqyo1Z/LZIeWMncF/Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g1AKtR0M; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g1AKtR0M"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-431481433bdso32251135e9.3
        for <regressions@lists.linux.dev>; Mon, 18 Nov 2024 14:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731969474; x=1732574274; darn=lists.linux.dev;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mqk98GP19dZ+Ay7HEP68kLZER2bT/NkIqYTu8jMJ4BE=;
        b=g1AKtR0Mpm+nfxlIfgZhYPIIaEPIysdsqhYYQMyJCYZGnz3n1Z4/F6V7GWJ5AVfcmL
         qOgvSnWOtJdfz1lT9PUQYQCEdAHPth6dytHGfn6M36xflZ2c3sagI4t2Ng3gcEJ2bq88
         /D/Jj+gydps/CR1LJnG8On1Ehy6S0u/dFjorqZvPAi0/XiC3sehmsMroG0mdbjK0Y0Lh
         EgBHn+gJPJGB/marvXb7xHmN6qiwhkR9TtGJEmVHN3VaVlYlzVAeEXwfFiTiXJ8BSelU
         Fw8hVLQqlhHU/Jh9HR6SpBPq8EX+/JYPdnlyReET+oAlck6glnrbcBfy8iuMmuh0cD6V
         6MxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731969474; x=1732574274;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mqk98GP19dZ+Ay7HEP68kLZER2bT/NkIqYTu8jMJ4BE=;
        b=xRt/8M6Z7kKGRZk5OCe4fUuHQIPyQsaDXNgxrLqciU1ksOj1v8GDGcRS23in5JrYz1
         MjYMTGMpx4a+hCxkEXxWjHNVrdswGVy7FOBmi9vbFrrY+VpoYKUXka2WJBaadwwgVmZb
         hLhI++9rF1fFqAJKMZ8et3qaQzmV+14R6ASG49AgfN2XfLDEpEqltOMChyEiTGeVTcN1
         U8KA6hB49lb4mwLy9oOWZsODr8aSfJSh0tN/loTkoIo2xWF2LD5LLadNNSc18Wl79Ocx
         /7RLVSbUr3DQBeBhevy27BpK37nfOWPnt8RwTGfEAvdMeNqYRFAgCcacxGGGorB5SiqA
         Xfpw==
X-Gm-Message-State: AOJu0Yy6dU3EHDqJBq/5NJeF56EeR8lMuH6OastlidhhdlCVJkXTZtk7
	4IDpX5TYjC3Bdt8buBmWA+qB0kmx3FWa2tnNzznklVcx42RjhSomr/gqznvY
X-Google-Smtp-Source: AGHT+IE3SFHyE5Qki0NW98dZvHjU5gfqvDXNiBgpGmZOBeJfpfKrU5oHl2n5JhG94U3CN9nntvSj4Q==
X-Received: by 2002:a05:600c:3b2a:b0:431:6153:a246 with SMTP id 5b1f17b1804b1-432df726227mr121167795e9.13.1731969474251;
        Mon, 18 Nov 2024 14:37:54 -0800 (PST)
Received: from [87.120.84.56] ([87.120.84.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab7220asm168894955e9.6.2024.11.18.14.37.53
        for <regressions@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Nov 2024 14:37:53 -0800 (PST)
From: William Cheung <eshansarma772@gmail.com>
X-Google-Original-From: William Cheung <info@gmail.com>
Message-ID: <d1ca63ae33a009376edda807c6a2928bc65df614432a84df898d66f95e50375c@mx.google.com>
Reply-To: willchg@hotmail.com
To: regressions@lists.linux.dev
Subject: A Proposal
Date: Mon, 18 Nov 2024 14:37:42 -0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

I have a lucratuve proposal for you, reply for more info.
