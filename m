Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B39433DC
	for <regressions@lists.linux.dev>; Tue,  9 Jul 2024 04:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720498255; cv=none; b=NNQ4aiQicA5LvXzAXr3IfEFoZAL2p+sqA0fB5EzNaKtm32RaU+ETsb763tdv2v1N7nFy1YQyqNXCjnlQLnK4+fgs8UNScJER2vVkP/1DYw+O6Mk86fYphJaNWjw+ijUivziiNca7SNPUDDZqtYJhtPw4eiJbE17M9UyL/OayBHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720498255; c=relaxed/simple;
	bh=WwBa9BXZQA9Efu51eAIBLmbMfDzQGg9zvOjMoSgyZ7M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MES0ELgukqGVRFqRV6STKckSC0dRvl9Vc2oAxsODtvOPS3j9JUj9pxWvDcCck9JE4FUuD0cETu+C9vdrDm1fs1diIo0PkFdV58GkxSpINyiDpgB2E0FKVbkuf7rdD5YsxxiRE8kZ6UzijxlDe9M4QK28bj/+RF9Xd9X08ZPeY/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9USV7m/; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9USV7m/"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-75e7e110e89so2523049a12.3
        for <regressions@lists.linux.dev>; Mon, 08 Jul 2024 21:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720498253; x=1721103053; darn=lists.linux.dev;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fXx0sxLfBp39ss0ZLVw4RKIlabfntiMnDwiiVSgheOA=;
        b=d9USV7m/z53oBkMKrI2BeufJP2vxYteSIUoNGkul7CiwYDMjstE0I/uiYvkuRdCeOT
         Ul0lY7SHiQJvWSW21WdY+WsqUDQIfOYhDOLL0DQavcSVIg7dSgkzmQYm7pYXnqaGa+Mc
         7uldGKU8ZC6VPl5CpVF/BilsPBeU7tZA+ueQ5A7xnVTjPsEJbTcnqlh6XfxJh9d10pZ0
         XDuLRkGG6aEsVGiyJaSNO02PJYqH/T9z4BVNFV0TEJUVghtoHYOLMpwSbbRrBIZfNrWS
         /qQXAVk1J964vsoikkI4Q5nNdAavkGveLujYXUDYTmX9qPk0tbxXd9P6HkqoPGnieAsM
         ETkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720498253; x=1721103053;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fXx0sxLfBp39ss0ZLVw4RKIlabfntiMnDwiiVSgheOA=;
        b=C+cvLtmC0kV1ZDiW+ACaufedK0Th/meRMgt1eQPVAGfVK419/lupxU2UqGJp9TnGNj
         ZomavG2KVddXFu1n/wiLk0kanujbEhAB0Og2QB5kZR91xb/npgyPacXRmyu1pqse4+bp
         9ysXGyXUFzjve2PxWtxEtC/vAn0UZa5d15x42WquYF8rFPaKRBxmFGP4oyrDM+DjfztS
         eqRg3CYrFMxNM7u6b3vg9OnZ4rmxc4G45p/TyHKELk1pGLfLIPOHQpQ6W2uZkm19KPBv
         GO1nEA6fEVn11yulchJgQfzmwQp7HCit+GgcRITwrxLtLhxjNJPM0Yw65el2IgbncKvQ
         LT7w==
X-Forwarded-Encrypted: i=1; AJvYcCVSCmDLc4dxOaS0mL+Fm71tNX1c4IjZ+eXSllLYdWHekd13iib4tBsYR1vEnCy57U9oBP6VSw5r/BfbcRivpCGP625luH7iETf5jfI=
X-Gm-Message-State: AOJu0Yw83EG7Bvw8QEQJLltxK5w95eQoc8B6CrcLtUPW+xsAmy6nXEpn
	/J0wz2viRzTXO15Jjr+Ht6ZXLnsJVpdQPR6Arvi3xDGK7MAJq8uKTFGy4pR9
X-Google-Smtp-Source: AGHT+IEwMXV0jbIqGc+PaZ6TD7061c9KxYMG2X/7h+OrJ9MVmcaDcf1X5ENn1TZN6gt9o0KGTiJXIw==
X-Received: by 2002:a05:6a21:1a7:b0:1c0:f2a5:c8f2 with SMTP id adf61e73a8af0-1c2983ba264mr1490532637.48.1720498253067;
        Mon, 08 Jul 2024 21:10:53 -0700 (PDT)
Received: from terra ([122.171.22.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6abfc56sm6183215ad.196.2024.07.08.21.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 21:10:52 -0700 (PDT)
From: Forty Five <mathewegeorge@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Bernie Huang
 <phhuang@realtek.com>, "kvalo@kernel.org" <kvalo@kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: RE: [REGRESSION] Freeze on resume from S3 (bisected)
In-Reply-To: <6673a2dc01a941f5900da7393d160005@realtek.com>
References: <draft-87msmrdgkb.fsf@gmail.com> <87h6czdexm.fsf@gmail.com>
 <6673a2dc01a941f5900da7393d160005@realtek.com>
Date: Tue, 09 Jul 2024 09:40:43 +0530
Message-ID: <87o777tdbw.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Ping-Ke Shih <pkshih@realtek.com> writes:

> Right. Only apply [1] in every bisection step. 

Patch fails on 57f22c8dab6b266ae. Could you send a version that succeeds?

Bisection log so far:

git bisect start
# status: waiting for both good and bad commits
# bad: [5bbd9b249880dba032bffa002dd9cd12cd5af09c] Merge tag 'v6.10-p4' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6
git bisect bad 5bbd9b249880dba032bffa002dd9cd12cd5af09c
# status: waiting for good commit(s), bad commit known
# good: [bcbefbd032df6bfe925e6afeca82eb9d2cc0cb23] wifi: rtw89: add wait/completion for abort scan
git bisect good bcbefbd032df6bfe925e6afeca82eb9d2cc0cb23
# bad: [480e035fc4c714fb5536e64ab9db04fedc89e910] Merge tag 'drm-next-2024-03-13' of https://gitlab.freedesktop.org/drm/kernel
git bisect bad 480e035fc4c714fb5536e64ab9db04fedc89e910
