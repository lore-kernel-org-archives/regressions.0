Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7D87083C
	for <regressions@lists.linux.dev>; Sun,  7 Dec 2025 16:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765125968; cv=none; b=cC4ROpLu/qbb0d+wEMgkT5UN5noPgKgwKzjsjky6kjw80PlE71W0B19G1ZzGk7N/5lVFSOswcUXrGbSfT7bSdR8jvFBHONyoEcRs9RTCP/KI+yQ3Gy4xEnI5cvfHvyZZl1aa+f0S5xt0dpG+we+IEAXfSWr80l2er4apMOonDes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765125968; c=relaxed/simple;
	bh=I9Qx9n4Q79mBOZR4LXGGw10jVvLQ+xkac3lc1hwUVxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EZUgWXcrJoPDZgqruYVJAQzhoOAvqkVXqOx/Nqq9UOwqGaWoeskAi7p3uUG5oC06crfZzLirK8SIT/BPmVmc81HBSHjSrKwaTMe1LRwe6ATmf19/NXH0dNUyBU6r2LNcyyJgmGJYbPYQMwa30NTwg79eOyxzfgIfeBxAQFwvnts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4+jbXHP; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4+jbXHP"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-786635a8ce4so28744617b3.2
        for <regressions@lists.linux.dev>; Sun, 07 Dec 2025 08:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765125965; x=1765730765; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9Qx9n4Q79mBOZR4LXGGw10jVvLQ+xkac3lc1hwUVxg=;
        b=N4+jbXHPOhWQoNKXs9NJuvHezTqroS30esJdfalyRgmYSyKNRvniNW9AmrGc8s752T
         ggvVgV7zAPPM/9W8QfTYLjSX8iq0RPYUNFuNnSrv4vs9EeP4hM36XG4MdMSj2Mi2ihDc
         EW/imPZiNzpnPAL7QVhdTqu2eNCPnoWiPj/AKYQ76BfrEy8t5RpKoFDXwB1P9XxclIFY
         PJ039FbB6jHk5flDWy1N2ap33xH6umoEekJjOxCNw+52sVmYqljvLwruJ+80XHFeMy0P
         XAPCN5KNgc1yNe7BlmqWIMi2v/p+wEYf5zFR0KVBl+NNNivc4hnJK2RWhbZwogegKCjD
         1SsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765125965; x=1765730765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I9Qx9n4Q79mBOZR4LXGGw10jVvLQ+xkac3lc1hwUVxg=;
        b=tPcQhZxswCIRB8ctWz5s2gtmE3gzstJ6yZeUGhqEYg+6nfAfz/mCgy8zku2vYgbqzG
         6VAtJ77Nmwrk9vUMVNe7oBD6NaASMT5FMdjYHhNq5PWGGpzGc/d97pHsrDtYgV68GZTh
         1XEUGAYdOhLvYFaupSBTbOQld4betomZIoFMYXGU2+MAyX5+yGKsPN/iTPmTKqSO2ODn
         4b0+djdT+zIzepsdod52+IswuyT3G6/XNtiZfbaMA82uANBnBW8wfoimIuI1mJ/9xY8Q
         W5K4b6OqS4q69YgAGU+cbPFZxATPSbmnPkCx+M2np7+AI6Yw1oTrEqKo+3Q8BMYg5b2b
         IjNg==
X-Forwarded-Encrypted: i=1; AJvYcCU7yVuTQO53paHBx45V2tGzDYzmJPe6DaD7z8QWRbqnJn+Xat7yIa2hfVNXJpPOBJppf7CtsWq+C9D+wQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywy0/2hJ+6Q/HiW+jKF7/6hGAWYgA8qyezEFNj7PM7jir+YSZJ0
	ykzqEIW4s0lFtC1IyKGkjUQBgVPb/vgAIx1jkFy6dF73BKpXJ2i6mgPZIMarYLca/KKwrOpSuxT
	yI6HSfy4F20xubExHBnCQrYnv7O+w+08=
X-Gm-Gg: ASbGncvNXncNkB21ct2nsBWOxKN3y8ROcFf0VoHdabqj7QyNT4S6g/BKUHAT1jJNHkt
	dwFBo5VsuMY7TeeG2DnL8C+8A/jq/OcVnZKh2/VLl/5J/q8dnI0AQfGcgPNoV1RVyUcHBcCHnkI
	0gLBqHqgMaTW1lclUl9VUMmJP+W7FLHJvaEu1v5Cqcitfhdc9U6u5u/Z+c/P3VinGJY3kUX08V3
	mXzlHTQ/duWK30ATqEFHtmKs/NYvL98tbyt1Vv09+1UtkJ98tJxiCn8+bw6ETp92/Ygbwrt
X-Google-Smtp-Source: AGHT+IFojsrwzBu58xmxqNiWONYhG9kxExBjgU7MJi2fTygt5IzjBHutS+yPKMllDxNSv0iDWafdsrpjLRVd2Us7NKw=
X-Received: by 2002:a05:690c:d91:b0:788:bda:47e0 with SMTP id
 00721157ae682-78c33b13875mr51874287b3.1.1765125964673; Sun, 07 Dec 2025
 08:46:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aTLjgEVfLCot0cSm@smile.fi.intel.com> <20251207040459.3581966-1-safinaskar@gmail.com>
 <aTVUakljrd-sysxP@smile.fi.intel.com>
In-Reply-To: <aTVUakljrd-sysxP@smile.fi.intel.com>
From: Askar Safin <safinaskar@gmail.com>
Date: Sun, 7 Dec 2025 19:45:28 +0300
X-Gm-Features: AQt7F2qzPmg7UQ_bISru9-YSQqKjGJESrT0FY3SlqV8KJLp0EpCcDQigL4yk178
Message-ID: <CAPnZJGAxhXNOw1V5FTPK2Mrvu0YAPwm0Ph4UHd2aZv=kgx1qWg@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] Dell Precision 7780 wakes up on its own
 from suspend
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Dell.Client.Kernel@dell.com, bartosz.golaszewski@linaro.org, 
	benjamin.tissoires@redhat.com, dmitry.torokhov@gmail.com, 
	linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, regressions@lists.linux.dev, rrangel@chromium.org, 
	superm1@kernel.org, wse@tuxedocomputers.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 7, 2025 at 1:18=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> I think nothing. It's better to try to actually fix the non-working scena=
rios
> rather than remove the feature completely.

OK.

> P.S.
> I'm sorry, but why are you so eager to remove something? While in many ca=
ses
> removal of (potentially dead or unused) code is considered a good thing, =
it's
> not always the case.

Removing code is easier than writing new code. :)

Speaking of initrd, I tried to understand Linux init code a long time
ago (out of curiosity),
and so I wanted to remove initrd (to help me understand the code).
Also I saw initrd
deprecation notice back in 2020, and I decided to send a patch for its
removal back then.
But I got time for this only now.

--=20
Askar Safin
