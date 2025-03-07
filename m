Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9CB219A72
	for <regressions@lists.linux.dev>; Fri,  7 Mar 2025 12:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741352305; cv=none; b=C5AM/Weu28uyURjb14L440o40WtbqmHzJHJNf25SW9TUYaP0gOJ+vZ87LGx4nAZMS2BmaXNK+VnlbM189pwtS3K+1A70uC0W9vRL4IE44uI/RNf1tHp8+3wtScnQpW/cBrOFwvi6g6H1/2L6tnBp3T+Qm06nhndh7D5TjKxg7cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741352305; c=relaxed/simple;
	bh=m/auXCDofkYE2fnxWAv+1WSX5E3g2xIMSNEOGatdYws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bGaxQ46IqaoM2DbfKH3RsJm4y5/ahU1x35GZG6K3mLQ/0u1KAR9mwU83sSjU65Ja9BucMY/f7fU1rUV3mn+f6n7X+AgCv91j2CoprFcpDr6cE0p+vfqTpSPvIx2t9Bx8gIueCOD8TtE8wqjUV6MqL/6wnC+SQXtLzUM8Jhv48D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W7R6kfce; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7R6kfce"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e4ad1d67bdso2832701a12.2
        for <regressions@lists.linux.dev>; Fri, 07 Mar 2025 04:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741352302; x=1741957102; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m/auXCDofkYE2fnxWAv+1WSX5E3g2xIMSNEOGatdYws=;
        b=W7R6kfceTz3Nh3q6U4c4kQEyB4d4K3AEobDXqew1BtXBXcnl8DnQqNCGOOoDXBjj+s
         TfNGu1Wcw0k9ChXIrwIQLGrq8XMFew/TsATqf0/22IrgwZg43tVRQOp14roiH0/YF/uT
         LwrXPsglzTnvmtnNMwryv4Rpw8X9Hwi9v3l6AZu5iL/OpB+D9bcAiT+AOi86MPmW+OLP
         nKIGEpw7q40nn59tIjwP+15dy17YaNKWP7gDQ3EEG1JRtDLD0nVzB9Wsv5cwiz+YPylM
         WUUpih1x9fYiEr5hnx/NoD49MpMJaxHJULNvR7s8EDTJ/EjZ8WS8TddgHpvQQvsno94K
         rBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741352302; x=1741957102;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m/auXCDofkYE2fnxWAv+1WSX5E3g2xIMSNEOGatdYws=;
        b=RonnOVpI7ldc78b8yX8LBKEIA8j2+Okz8QGqjXYw2aefMvjeuSXqD3HhuZHXBSYrSo
         0OCzxr10/d/C6SrNMog/jMxTiNk5NBCeQQrse6ntXde4Lr9vgVdMLeEmHuUF2tBToPzJ
         +TXvxpHhCzmUPcIp8hKzDZUcdXG8ZnieJ3Dar5qp4D99iQ4Z4ktFKYYB/WD/y1R7Xtc2
         TwjLJHYu0iFPQcZXJwDzFLv1mXNtZPxHXt129Q8jTNK2Ad5JNW+tqQo9L4wc6Ov0BETV
         SHtoN89APCHO7E9Tt8t8p14b9CS1XmZwEJGD6b2N05GhnKajXs4JRv/CTcbxYrVSMFTP
         hOeA==
X-Forwarded-Encrypted: i=1; AJvYcCXqt28smilACGab0KK3F9qxJ3CWnythiWW3ZrY/nCFXpjzi58POAb3HxtKKFdohik4AbXSMPs6zu2vNCg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxr/5wgnfvHHe9lgNGygvdfyYNnS0zramXIgjj+fHeoAzNnE+yt
	J1aP8n6kGP3JCk7oefiEu5uvss6sWXOlN8Y0VvTrhRV7iWlHp3/M80B6ESBzP7ZVPGpTMm+Seoa
	DBXLV3ntrwo4zU4hnHlkXixqR9Pk=
X-Gm-Gg: ASbGnct8c6RgEyW4wu8hO1oNnI5sB5nDE+uzlNNCvjkC3MkiXo9kWvN9JkAx8MaLw9F
	SO2LHMumXmk1tz3Ecik/HqTky6zrZbFR37BVm+EwOczTuGVizWklxuWm6suRGwN7DyqvRj3lIVS
	Ss+sdK3yrpJj0IugGht6Yh5oy9
X-Google-Smtp-Source: AGHT+IE8oyHIzhSNVi8QTlcKV5tKJD/5qayWxJTZy96ZNvPJRPDzcivpMxNekZW4IxHB1lECfsHmXcvntjNB3+y5r4U=
X-Received: by 2002:a17:907:7e81:b0:abf:4708:8644 with SMTP id
 a640c23a62f3a-ac252fa0d03mr311432266b.43.1741352301547; Fri, 07 Mar 2025
 04:58:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAMpRfLORiuJOgUmpmjgCC1LZC1Kp0KFzPGXd9KQZELtr35P+eQ@mail.gmail.com>
 <2025030559-radiated-reviver-eebb@gregkh> <CAMpRfLMQ=rWBpYCaco5X4Sh1ecHuiqa91TwsBo6m2MA_UMKM+g@mail.gmail.com>
In-Reply-To: <CAMpRfLMQ=rWBpYCaco5X4Sh1ecHuiqa91TwsBo6m2MA_UMKM+g@mail.gmail.com>
From: =?UTF-8?Q?Se=C3=AFfane_Idouchach?= <seifane53@gmail.com>
Date: Fri, 7 Mar 2025 20:58:04 +0800
X-Gm-Features: AQ5f1JpoCfaxtq2-EaR_wPAspVpLWiZcfCV5Kt_4iQsyOusnJqgKaeK-i9--rX8
Message-ID: <CAMpRfLMakzeazr91DBVyZQnin7y6L9RB+sPFb59U1QZvY3+KBQ@mail.gmail.com>
Subject: Re: [REGRESSION] Long boot times due to USB enumeration
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dirk.behme@de.bosch.com, rafael@kernel.org, dakr@kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dear all,

I continued bisecting and while applying Dan's fix (15fffc6a5624) along the way.
While the patch solves the problem for some commits it seems I am
hitting another commit that exhibits the error again
(25f51b76f90f10f9bf2fbc05fc51cf685da7ccad).

I tested on top of v6.14-rc5 (7eb172143d5508) which has the issue,
applying the fix and reverting the bad commit (25f51b76f90f10) fixes
it.
Both the applying fix and the revert are needed to resolve the issue.

Let me know your thoughts on this.
