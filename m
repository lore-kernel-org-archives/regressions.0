Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60846197A6C
	for <regressions@lists.linux.dev>; Wed,  2 Oct 2024 09:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727860752; cv=none; b=szL9dRLp0KcCg0HnJh6y1cpAN3XbbNEjJar/oJ1CF4WFqtJmPKcsPcHIZAGgjve0KFksKcqE4C+n16yLfUvRcMSmiMS/Pl7bTxbL+6xg1ucvCwMMzL68QJxKjwaufkUOTrpOKJYLGIcMRrxs3VJ09tWGSf5DhsP/7smSOpldUGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727860752; c=relaxed/simple;
	bh=jFPfAagBlJdQ9SyZKWMbHOeAJZ9ce6m+cLeMK6+fiFM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=QbH/B8nWmzz+O8hzz++EwnRAEqyx/KE8n9fFbEzVYKqVsJRvqMAHvoE0+SsGSJBwvPZ32rJ3jJXQQOK0JW8Yvx4SeK5ZVH/8wUK5XgMYc+GwtDiaVL0nOX7vusbzNQpEDKjbZnlRqY5ACIai2ZELvSetCnU7eza0AlJC7XOa7sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=tT5sgvhO; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="tT5sgvhO"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42e6dbc8778so9530345e9.2
        for <regressions@lists.linux.dev>; Wed, 02 Oct 2024 02:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1727860750; x=1728465550; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFPfAagBlJdQ9SyZKWMbHOeAJZ9ce6m+cLeMK6+fiFM=;
        b=tT5sgvhOvrBZl2x6FaC1l3f20eIEdTMpxC4j2W25edjvu3JMCi0DfEg/w+e+DD3BUO
         4GH5E2EUcutDs85ziy/9h+SHIpzpYNe/tQra/PFWgpnNjcY1tjRaZSXlzHeACmuYBfNf
         WN7YKHhDGm/z+/lgOObDjKaRVcG8TCpSfncnk6AuEYpeOqIsDRxWNSWr7E+/IQ9QTssK
         y0WMKnT+P/0UzmzWqbKaIrerHXWRD7YkwXa1TRrHEoJU7JU4OPf4u2sY9cBcSk4cwKYz
         LsFvg0PMp483qPu3px+OpHeDbeSL/zgCtfnXjZ/ulO5WoVphP+U5gHUYvYzbK7mf+6VZ
         sv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727860750; x=1728465550;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jFPfAagBlJdQ9SyZKWMbHOeAJZ9ce6m+cLeMK6+fiFM=;
        b=pCflEv4+0AK3TpBx0YATEU9IhNDpDA+7xquf5BHhlnNzLQjJoZnkXv05Fz9IKOBGbH
         JAm/wakjVmTqjBUjdHmROwRmShB2HgMDcmaqpMoHSLkRwwg6O67002QYpXLQ3gvsqbdC
         eB89QOPg/JtBH0hFjq2GGTASdiQalD/ej7PR43WgG7D478d9vPUuwLFfDCTNEpZyuht7
         RWCSXhVGTDtNn07gVKV2KNC8+fWmws7fs69XpAr+g29wpJROsFtmX7qQJLuDc/w0uY9j
         KeiUhfx83oBNTtj/CFX0WfeZFx5wtCGU+s1j6OZluNmFr69dIZ+66TUP71gII9/4kAiX
         wkVA==
X-Forwarded-Encrypted: i=1; AJvYcCVzK/O3a+7P7jhz8WwjBlQ7HKc+RUKe2MMUMdGRNmKrLvHdssE8GTP1Sd7Ne77YBEVCbktKUL/QqHe6QQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwgU1WddJqsUXhpkp1ATt18BDOPnOTVIHhCV3uLHGzH83Pg9Aw5
	i3c5VKAEpkhZ+Acwfph2DjwvsF0xlafPA2RXav05zcC18+J4CCGTIx/M7xMUHXSWBZMA/iT8bqC
	9
X-Google-Smtp-Source: AGHT+IHWV7mV6w1yfuYNSbBDoDmOfkbxchm61Fu5e/nGx6AlXWl4Fno0/aWgzeJagffw9rTAISDAYw==
X-Received: by 2002:a05:600c:5126:b0:42c:bfd6:9d2f with SMTP id 5b1f17b1804b1-42f777af1camr8361385e9.1.1727860749493;
        Wed, 02 Oct 2024 02:19:09 -0700 (PDT)
Received: from smtpclient.apple ([2001:a61:a4f:301:4862:84b0:b69f:936b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f79d8d409sm13410225e9.1.2024.10.02.02.19.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Oct 2024 02:19:08 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [REGRESSION][BISECTED] erroneous buffer overflow detected in
 bch2_xattr_validate
From: Thorsten Blum <thorsten.blum@toblux.com>
In-Reply-To: <202409281331.1F04259@keescook>
Date: Wed, 2 Oct 2024 11:18:57 +0200
Cc: Jan Hendrik Farr <kernel@jfarr.cc>,
 kent.overstreet@linux.dev,
 regressions@lists.linux.dev,
 linux-bcachefs@vger.kernel.org,
 linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 ardb@kernel.org,
 morbo@google.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <21D2A2BB-F442-480D-8B66-229E8C4A63D3@toblux.com>
References: <ZvV6X5FPBBW7CO1f@archlinux>
 <3E304FB2-799D-478F-889A-CDFC1A52DCD8@toblux.com>
 <A499F119-5F0C-43FC-9058-7AB92057F9B3@toblux.com>
 <Zvg-mDsvvOueGpzs@archlinux> <202409281331.1F04259@keescook>
To: Kees Cook <kees@kernel.org>
X-Mailer: Apple Mail (2.3776.700.51)

On 28. Sep 2024, at 22:34, Kees Cook <kees@kernel.org> wrote:
> [...]
>=20
> Sorry, I've been out of commission with covid. Globally disabling this
> macro for clang is not the right solution (way too big a hammer).
>=20
> Until Bill has a fix, we can revert commit
> 86e92eeeb23741a072fe7532db663250ff2e726a, as the problem is limited to
> certain situations where 'counted_by' is in use.

I already encountered two other related __counted_by() issues [1][2]
that are now being reverted. Would it be an option to disable it
globally, but only for Clang < v19 (where it looks like it'll be fixed)?

Otherwise adding __counted_by() might be a slippery slope for a long
time and the edge cases don't seem to be that rare anymore.

Thanks,
Thorsten

[1] =
https://lore.kernel.org/all/20240909162725.1805-2-thorsten.blum@toblux.com=
/
[2] =
https://lore.kernel.org/all/20240923213809.235128-2-thorsten.blum@linux.de=
v/=
