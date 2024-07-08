Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D2613F428
	for <regressions@lists.linux.dev>; Mon,  8 Jul 2024 16:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720456237; cv=none; b=eHurAq1J5FNhg6oJdH5UreWUaBBQipqHkKrnasB23B//YSuZeHHjfD2WvJfx+cOk0v7jUa8UrmPjyYu3eXWPkrUq3Iw8WeBjMirVUIirMQo0WJAj/VtX1/4Xq18ROsGiV+p++3EhiX6+PJVwlwCN23FX7HWAFKrqDtyGLrc7wVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720456237; c=relaxed/simple;
	bh=ZSzzoKuc4n1mCJoVWKuUN95DVawIAjXwvH0TinrfKjk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=i85M5PI6TvJD0EKhApjvs+niyMI46eid+y7O70QgMQ84Tz+c6Emlb6O6KL9R1oG3Nb5Lc1T9echGI8d5Jvll3bLLuoApWHgCexXWGfYKrycmxiYnAcGHNFcOQLntF5sqT/lZ18z3SWlJohJt7vcxkwWTOI6CEiQ0F3JV/o2egoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cm75riyi; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cm75riyi"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1fb3cf78fbdso19903655ad.1
        for <regressions@lists.linux.dev>; Mon, 08 Jul 2024 09:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720456234; x=1721061034; darn=lists.linux.dev;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSzzoKuc4n1mCJoVWKuUN95DVawIAjXwvH0TinrfKjk=;
        b=cm75riyi7bKcyh0DT6ndyuJyV+SciTuiH5adqmerOPyNWdHyF4Kp6AwBld0Gj1Tsmn
         rU1erxreZAdn3hXsbvE65MEni3mnZk0jyaGWihnnc7Cvf9Q5srTuR8aIi43nX+irj95B
         T81t7hr9Hw/XxTt4qcazgGYEZOC8gMUFV4+lyNvkn+5v4xWwHKnjsZwXFVL5ECYpESp7
         n9kKAbZ0WhsfZP/MXbymgyHV0hRxiz7OCTA5kZrbgjZsoGD9eVAHOQ3tqHUMdVd1M5MZ
         FpgaXtmWh9PUfJd1+Cxlq0eHXyCTSZqGP+1jJe+uinYraatadUIYtPu1sueH4Xg4LDKn
         lb4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720456234; x=1721061034;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSzzoKuc4n1mCJoVWKuUN95DVawIAjXwvH0TinrfKjk=;
        b=fNI9/e/WmHO0c7H1L4y3tqY1sBuAgW48q5s/jfQzNnlTqeTw8WgU2lUHwN1Rb4HQaM
         0pP/s5pgsSSAuEFXAWS6+UaYqGywhIsw06R0TRPLRWTPhG0kJdZ1wIWZWeDwC5IfH2oF
         XL+bHH+8bfNn6B1nYLfM/3j+SqhK+b1g9HP94ypWHqaa3++maqBURa5KU9mHbs3vETih
         fRqoAfostC1cu/OBrNctNvk4v7RhDdHdycVwwBPOC4LaUfpdemYk2dj5L+/PSfcAec9c
         sTUpiLDCk3t3RM0XlqGi/WTqM2iiresGeOLDstBOeGQuKxvqAk1fqFJAIEzMQtw76Kms
         38KA==
X-Forwarded-Encrypted: i=1; AJvYcCWGmRhXXJ6AtM1dukMFIHj1FD91tSyrfG35YI1nkIRLatFab3BBvzV+0J3xAsZ3RJ7UbK+eboXZCuzwlxsf5HTBqvQU0tRyZhwt/+k=
X-Gm-Message-State: AOJu0YzCyDn/6kps2G3cyVyZLhD8H+K1eOwf57hAFzLANs5nftqnuq5B
	mSeHlf61DeIFNCDTMg6Xx8TQ5s5/8yVDjmGyPvZYIoLAExOzYpEyKhdCjfoa
X-Google-Smtp-Source: AGHT+IEXEWiB527X/hCtqLLU1j3dA87Wm0WNEf1RGNZAxDxg5UUMYNj41l59GStire7J85rfi66RHA==
X-Received: by 2002:a05:6a20:9186:b0:1c0:ef24:4125 with SMTP id adf61e73a8af0-1c0ef24b42amr3686843637.26.1720456234268;
        Mon, 08 Jul 2024 09:30:34 -0700 (PDT)
Received: from terra ([122.171.22.106])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b439c3213sm52074b3a.194.2024.07.08.09.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 09:30:33 -0700 (PDT)
From: Forty Five <mathewegeorge@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Bernie Huang
 <phhuang@realtek.com>, "kvalo@kernel.org" <kvalo@kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: RE: [REGRESSION] Freeze on resume from S3 (bisected)
In-Reply-To: <draft-87msmrdgkb.fsf@gmail.com>
References: <draft-87msmrdgkb.fsf@gmail.com>
Date: Mon, 08 Jul 2024 22:00:29 +0530
Message-ID: <87h6czdexm.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

> I'll get to work on the bisection, and send the log here when it's
> done.

Just to confirm - I should apply [1], and no other patches, during the
bisection, right?

[1] https://lore.kernel.org/linux-wireless/20240517013350.11278-1-pkshih@realtek.com/
