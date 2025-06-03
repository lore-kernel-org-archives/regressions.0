Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EDE1474DA
	for <regressions@lists.linux.dev>; Tue,  3 Jun 2025 22:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748989589; cv=none; b=kPDbpfoyAsVv6K1Y2MurONjQPQ3Nvsuf1vy5BQM/fEwrGK4zW4gEhNSZHJnh90psUt4ZmhEz/ZjV01NZwz5J0A3pRmYgqmLUVGHJwH50c4+5I67F8mcwxhklhSJA4/Q5Fu+3c1w3F4RkGfSbg5I8Aweqc16mvCni0lvObR9HTOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748989589; c=relaxed/simple;
	bh=zfz0c69FmOJCdnkXBAWjeZ3ec55qgxSzUQXGbh7JbEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F3Yra8inr9ft494GnqlrvU5bG7Z7luGCSKt2mY6pIeeTAyQ0YSKJopcqypRW36C3tFEhXe2jwpDIYEuY10rRfkCBDTSdiK0RR0qZRBZLNUrJrXCiYJyjomJYYDvr6/Z6oVGycZFV+UqyVWi/gVx7SsWXXUIgowMh5e3GX4wXEcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MU5/uRWY; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MU5/uRWY"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-23519817b57so4993015ad.3
        for <regressions@lists.linux.dev>; Tue, 03 Jun 2025 15:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748989587; x=1749594387; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spS60ybMSuhEoBnhprr08UeCQOS996miorjWsXmMPCI=;
        b=MU5/uRWYIFywlV2iwXicKOID1N/HRlo6fw3g3PWCcOo6zLlZjpEUmO43WUU+gCzL07
         8gIGHhLScRAsqKJXPZ50Zc9AzV53d2NBc/MWqBaEjMndIrA+p3gQCxa+WLug74RsExhY
         Ccm1sLCKNFL2h5yS0CQhtXJxS7syFVxbfyUTrdifbHrsOoAJ6aH1hCH4E8gCGElZFDTj
         mqpTrUU+ojhBA/ShECGkM87hfdoxgHdjICXQ0VFF1+jpGPZpRnnwlxcNfu+2jBwSIJFH
         ZLH8CShlx/yYMCg0L4zAHQ6AWMKo+1dv4MSLQYODU4sP1qWQ6+YKIHHXn6+AXO6q+3Fy
         D7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748989587; x=1749594387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=spS60ybMSuhEoBnhprr08UeCQOS996miorjWsXmMPCI=;
        b=qGa7HuFIEit+/vaa9yraYYH/7MG7+Qt0XHOL30D951fb18LYTGMbKArx/Qt4psIGbb
         ND8X4k6X+crs+5t5YmPG5ZiNZMU7ZB8wfaiX5caLVcIXslp73FsnsMB23tTq1yS9v7MT
         0WISZyVlxtPpRuHHZp+WRKb3ak4SljulUsB0KC5irRMrRk/l2xrzku2dvidHaKHAkZdL
         WQBS/rfojGSLWb+IjTrpJ6xU3CwDmjNORJMa4JvqvSrKeXgvuqpgYkjmspA0ufptI9Qr
         klNJ70a/K6eP9gyxESLbRazK7ETqINSZw3r05X45IR7WgOWq1MfR3stgOqqLsZCnT9dG
         obgg==
X-Forwarded-Encrypted: i=1; AJvYcCUp9hlJ/v+Z7XZc8rURsFV0SXbM6qkex1e8y/7s8AlEaCXsdtGIQS+43sVDBVAHeco3mkTw+DLUXYIGCQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxd6JfHb1bEKrjJsj8A3sDagD6k+ngOsZKcNX0tOLwmKKNKga6i
	4CYn5fni8L+IjAMcdDJBJ9CJ/wPAppo9Tg4OwsulbXzUCrLCnXhB0KnhXW8FAa2UZQ3QLefIYvo
	U4Iarj4uh/qCPrnyyBYL25rOJL0lWmMk=
X-Gm-Gg: ASbGncsaYaiU6NZ7at4/eclYxSqs+B1Rs7jGYDuZKP/DDWYLGZ62RyR8guUCln47dar
	gaw4clhvJdrj8El4PgtFLusjBK6grfbSXnk8CxLD68IHU/IM71q9o+WvOzBsVvOlRik7nIZQ+M3
	9JQhGy1SEn7dR9/0L80EIfrjXSU6XI9q/X
X-Google-Smtp-Source: AGHT+IHYe4MifwZmarTiGrmPgQXYs94V6HqZaBrwfAdvRpZP4olnAr0bDFZ1PORuNElDs5cZ2+9XBUxmqKGqQyL6VWI=
X-Received: by 2002:a17:903:32cf:b0:234:c549:da0c with SMTP id
 d9443c01a7336-235e0f37687mr2464635ad.0.1748989587025; Tue, 03 Jun 2025
 15:26:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <700ebe13-c2d3-48e3-800f-8dc327efb6fc@gmail.com>
 <CANiq72mFL4dn+0JppLLfxyKnM+xYwKeduFw2j07hUfxWVVHdUw@mail.gmail.com>
 <f5d5b84c-0850-4df9-bad7-61fff12c4248@leemhuis.info> <CANiq72=+qUNJu5j+uoveMrTbngwA89+ScwjUPd9OyVGqps54aw@mail.gmail.com>
 <20250604073118.4205f303@canb.auug.org.au>
In-Reply-To: <20250604073118.4205f303@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Jun 2025 00:26:14 +0200
X-Gm-Features: AX0GCFsOpisR9zReSwsbnHOeUt07nmPeJXowIYZoqNdvdu6R35lnffHM6XE6fuk
Message-ID: <CANiq72=EttF8tieqakoyYxfu_-LyUjCTcaogtO-Z1HajGx7LMg@mail.gmail.com>
Subject: Re: REGRESSION: armv7 build mismatched types
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, linux-kernel@vger.kernel.org, 
	Linux regressions mailing list <regressions@lists.linux.dev>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 11:32=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Damn!  I knew I would forget.  Sorry about that, it will be applied
> today.

No worries! If you prefer that I send a reminder in this kind of
cases, I would be happy to do so.

Thanks!

Cheers,
Miguel
