Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795435980;
	b=oR33ngWl/5zr+ee6a0VpYUvvpcyy1z/7dDLB65xKoFtyh2gtl9iGy3QhLREnoLT0xble
	 tGarQmfXXmoFEV6d3TeyF1frN9qrjJXCrdH85MJgKD2+FQ5GzWz880co0uPgt1G5Qi58T
	 xqYzPPAiP0PZxB96yWEooPY/kxadvRnyhP9S47Ehx0BTCT/PPEW3ana4FQrIRduNbULKz
	 2iIPYxa4iZtEylQSRWhz7+G0NKapmKGIU6z4XRMenOZbWgMeLiMuIx5/iCcHFvorYNRs1
	 0JtJObc3QKYxe6Nt5DanZWhIrxdGqdpGRKX7so/3r+0xdeAn6qFRklvhSwtnyFqhdrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YXiKSe1b4sqmwhSslNYFvKYiTOVoSzJmWVzJ8m+MYNw=;
	b=wwVhRLXA8FYAl4Er4P8JB0BVJts9YQM0rRBC1mQjhanaY4iMhtmhGE1Ccqk00tWMqjSZ
	 u1dQhArg0lQJNMtJYbiFi/Zn36jAbixSjn1rtdEE3e5DWz+zyP8NIIN8JpRewfqFhxwDg
	 CBxAcmoVOMQiB3926fmCzBqXaLU0hdojmtBwZl95paXd5DD3WJNQfpHxN8IRtQXYXH1fI
	 kxeMP2WbmZ8KQxQ+IwzXRiD1ouM76nh3J+/QEo2PycqQ/m97jCqtQAXYe0SjBYnPkvN5d
	 gyuRaPT/2REnlqacqjOOlXbOPKgvtnkJMBQ3KqjNmTPwYoW9fwggdml+FPWh9flhcNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lJyKI1Mn;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBB0606A321
	for <regressions@lists.linux.dev>; Mon, 23 Nov 2026 12:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FBB0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lJyKI1Mn
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2f04bea9a93so26603295ad.3
        for <regressions@lists.linux.dev>; Mon, 23 Nov 2026 04:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1795435975; x=1796040775; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YXiKSe1b4sqmwhSslNYFvKYiTOVoSzJmWVzJ8m+MYNw=;
        b=lJyKI1Mn6y4ibOoVu+7vw0eXMHi7CM1G2nKt+rEC5FR2SygQosCGV85JSLOPD+sJJT
         PbGwgIXg7vh0rJmYb/Lakgum6skoYkNli19694qPXacM8qN+dtivlY9mkqfuZouVeby/
         OFSiDYjuKYywgybnS/QHFctvrUZMfedZrang119jMEGXfyhCSTF/UNkiWWB8a2KfVtGy
         iAHV1GDP0YUU1LH8YaSbOMUMYtVG2T+vGS23TIUhHCFMuIT/wELAI4Ks7R6R5xwl3r/l
         Z0nU3IE+T1wFaJfMHz10NOGzuk4ZIq0YQd1FVjf8EYQEVUqc6eaYyb3qUUHRdI9x9uvX
         fbNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795435975; x=1796040775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YXiKSe1b4sqmwhSslNYFvKYiTOVoSzJmWVzJ8m+MYNw=;
        b=xo2a0aQPZm5ZGrvszAJUR8SDlUDkP1td1vsSQJwatlZclGpjULsDdByX+GUnz2NIav
         DCmZDkkaj6pTvVKPZcngZi3F3EPmSqK5WFg1o6AMsgNYC2Fzm0S7oE4fJhxqW1Vq3fGG
         PNOpEZWuW62/mGsIgGkBBW/REZhMjZTbHWDpMPgQtbAm8KqII4ry5/8rY8Dx80qQvuju
         F6IDJyYCYZMoMOppOL7NCasib/u+xebj5zQv/k2e7rqTgmzD1lIn5YYWLCAmydyiVcux
         sChoSrPxJDNpru7og16QWvGgbp9dLkrh/iA5QON+YCakkD2castsOhWXkCCF5Xqj59Pk
         99AQ==
X-Forwarded-Encrypted: i=1; AL+hErHjYs1NGZhPufNAUyrdahitC1vW9rYi3T22dItC+5T5yex1PpzWasoWmX1Gs+JU0MXnDw8pdUnGj/JLRA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/RuJ3bR1fhVGHqkQK2C1UfzcArBU3uqxHFUp2qn9GWdfHftLuS
	ac7LpBBAaH1sw4//fVumNtJ8YZEwxkA17tlYxALPQr26HIsg1YWdEgf7B0WEYt8H4g==
X-Gm-Gg: AZFdTZdG09cLZVn6VKqn05j/y2Hoc4i2citHAcJ7JDRw6iWk/VClUT368WRn0dmAWiB
	KtU1xV3TTh9jUp3DEWvkQzb2EKU+JPJyYsakHSlgd2fThQPjV0JKyuQfB4MJukneFHrFrvQOR8r
	JW5nHnOKokPF9VrLgENqUFwEnUuSC2cFvYN8IzwRHIuHAvrqe1Gpj12rFF92DvNgWPGy1Zxxn8o
	oiql9rmBl4VRatk6PcX2h2DW76Asv+H3WrlijsaFNwZdfN2yrTBC/NMkVd90W1n+vWaU89+wpnI
	9Wa3aCkiO6HY4bPdI/P0xm7Glxx1I8YHVI6N7Nn5qIY2oVoQ/wLnskTW7m1U06IErHLmC3C4ng9
	hxcIpZBv6296VddLsVCnl9BYzJ75cV48MZmf3aTE8MG7nRNxeHu4Gvqz5YcNSLSKAnFoE1AQ5+H
	NEQy7HItcOMQZkhyTu1WcyJn5GprLnUhXvS8DAhaFSN2Yqg67ZlR4D2lRl8nlUzzWQR/smBinsd
	48Yx6yIKjXmDJrxWmK4gTlQaXM8HJPlVezJgSRM13x/K2rZwQHCpTN61gGw8YPkX/DxVwGLw6b6
	I50PePxDOfKCaajMo91oPJFxWhsX5b/B+FBSwz00DsBlmBB7oLJPqlTpTDi+/5dY9eutQE/EdOr
	6c1prD3+uqcmJke89Eg==
X-Received: by 2002:a17:903:1ce:b0:2ed:3ca1:848d with SMTP id d9443c01a7336-2f03f1ea636mr110975425ad.25.1795435974723;
        Mon, 23 Nov 2026 04:12:54 -0800 (PST)
Received: from cantal.lan ([58.136.72.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f099a4d875sm12731675ad.37.2026.11.23.04.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:12:54 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: Johan Hovold <johan@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v3 0/2] usb: core: fix failed device driver probes, add pre_probe
Date: Mon, 23 Nov 2026 19:12:49 +0700
Message-ID: <20261123121249.43867-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <329cd215-d824-44be-a1dd-3ebbf5c0803a@leemhuis.info>
References: <cover.1793669297.git.jjc@jclark.com> <329cd215-d824-44be-a1dd-3ebbf5c0803a@leemhuis.info>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Nov 23, 2026 at 12:37:43PM +0100, Thorsten Leemhuis wrote:
> James, Alan, what happened to this? Looks like it feel through the
> cracks after Alan's "This is all starting to sound very complicated and
> fragile.  Isn't there any way to simplify it?" later in the thread,
> which was more than two weeks ago. Or was this regression fixed and I
> just missed it?

It's not fixed yet. After Alan's comment I dropped the pre_probe
approach. v4 instead had onboard_usb_dev call the generic driver's
operations itself, so that it can defer before the hub is configured
(Johan's first suggestion). Alan acked the USB core patch. v5 is the
current version, sent on 2026-11-07:

https://lore.kernel.org/all/cover.1794018128.git.jjc@jclark.com/

My understanding is that patch 2 is waiting for a review from Matthias,
as onboard_usb_dev maintainer.

> Side note: another regression bisected to the above mentioned culprit
> was reported recently:
>
> gpio: shared-proxy: open-drain regulators on ODROID-HC4 fail with -EPERM
> https://lore.kernel.org/all/20261115-hc4-gpio-shared-od-1@iav.lv/
>
> Doesn't look related from a quick look, but well, at the same time I
> wonder if there is some subtle connection.

I don't think they're related.

James
