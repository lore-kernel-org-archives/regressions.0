Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF5E174ECB
	for <regressions@lists.linux.dev>; Fri,  5 Apr 2024 21:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712351354; cv=none; b=sN3zMGtpiZgNWVTwjboK7lTpU3wqnG8RRxwc2NQQmEnUfPOM8L7opPmv8sf8x0dPErhH4qZQuzUFB76qn3YpC8+ctGJqrpVDCYXd/xII08SnOlImipLTlk07IvMvd+CPlLsoKFDyVTGxZuaBl02oeTuKbOgISU5Mr1nPoSLrPrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712351354; c=relaxed/simple;
	bh=2YOecpYsyh+vm9vBQZX0fTyz2T1YdsNL1F7SgfXoFyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WEoLPKr6S0eUKoiXxtENzbLoqxHawn9MSn94DWH1+m8TpsQPpUNaZpxY21oX64/bqM81j9yAOckKRAAXOeeqU5FfG/IhERjmS8c+6TG5gfvRHmJ8CcUDrqbjaHi2ZzVYml0cHnKa2HwJqurV0Qe4vYFDHCXuNcRY+ggK3NGXe2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IFXe0yFM; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IFXe0yFM"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56e0430f714so1462a12.1
        for <regressions@lists.linux.dev>; Fri, 05 Apr 2024 14:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712351350; x=1712956150; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E1nP8K+fSotDuy4QoPEUBun3bv7r+0pyJXy5f5RUr3M=;
        b=IFXe0yFMyKzEENw0FjVbktkgqkjl3gxPTpg/rLAmujtZQUNRjgZXNzmjAdCmDzQf5P
         izw/pi9m7hss/2LWchD0FPYFWPFE1HPXjsEJnML+fMgwSvmhoqiYVMhyb6v/5k0AGl00
         FpiSKrv/cniFoOoTRJOO1psAKgmvz0aVNzslff3xzAUOXbst45QCEoLZgF/Gc1GBAWCp
         nzYggxNM5KzyOLVY1btJfGU2B5V8VPCsrpKkPHUHKWKYZQ2iCz0N/LE8nMa3gxJIXLSs
         TKMPb79yg4OYCIsKLiNXhh5SOVpyfqWNpSHKeKcrZMhtiSmtxrgTZUhseb+f6oP+56u6
         ge0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712351350; x=1712956150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E1nP8K+fSotDuy4QoPEUBun3bv7r+0pyJXy5f5RUr3M=;
        b=NgvfD98qd6FFZdVFUckHsii6N9u/MOOAtOKx3ffr4Ti80FDw5d3XZxTkuQLppOghEB
         UZFMDGf+ynuB2n3AECGDEwNc2GvGHZPhMiw3fYKvGzgzBoGm5sprALNnbur537kzxnpT
         v6FwWD8mOQpUmL+Xeev/xD0qB4liOiQPBIJZfcMqU392boUnZiSVD5wyI+f1BZDOuRD+
         x54ffeSLxacFNHLKNeQiaH1Z3botFROxZmiL8jhAsPIqO/svPMZNFwd9tWFpu+9Ool6Z
         oLXOnYKctco475TdEistKFThL/pxkgK6IijW30q+snR8euEb8Kcwq2Azu5O+t0VPqa9/
         wX7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQuqkR9QrrMMmwXfLSZdDpoh59MCsByw50VHh//0lcfQoELfL9Fb5OtV9Xbgdl/jkx7f8BxGtqn3gYJE05jfXuVYSZImp4gYcFjTY=
X-Gm-Message-State: AOJu0YyuTc5KdyHsTr9UEq3h6fKA8g60gKLG+jYjPzdN1vVK3z0RrMZQ
	3dWWNBuLZjxAZy8BrEmpfapkzg+swa+NdnJEZQi7KdJWaIPVVhdetIN+kf6DgbUp3jqUtQAvl2H
	RVDqSLyX47KupoA5JJRrHJBkLlD0M5LFBBLi+
X-Google-Smtp-Source: AGHT+IH6IwdzbaNmHE9q05G7M8OOFo6JwqXRFkysioKrnXxqk9sxeJ5AYEGVY6iQXgSOlVBzeAMeOTtELpWyHpXZPT0=
X-Received: by 2002:a05:6402:27d0:b0:56e:76e:6ea9 with SMTP id
 c16-20020a05640227d000b0056e076e6ea9mr45888ede.6.1712351349505; Fri, 05 Apr
 2024 14:09:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240404075740.30682-1-petr@tesarici.cz>
In-Reply-To: <20240404075740.30682-1-petr@tesarici.cz>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 5 Apr 2024 23:08:58 +0200
Message-ID: <CANn89iLZ9rkSpT6crP89RV-GPSnSxhUkjPSSh3PmiLNDH103yQ@mail.gmail.com>
Subject: Re: [PATCH net] u64_stats: fix u64_stats_init() for lockdep when used
 repeatedly in one file
To: Petr Tesarik <petr@tesarici.cz>
Cc: "David S. Miller" <davem@davemloft.net>, open list <netdev@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	"Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 4, 2024 at 9:58=E2=80=AFAM Petr Tesarik <petr@tesarici.cz> wrot=
e:
>
> Fix bogus lockdep warnings if multiple u64_stats_sync variables are
> initialized in the same file.
>
> With CONFIG_LOCKDEP, seqcount_init() is a macro which declares:
>
>         static struct lock_class_key __key;
>
> Since u64_stats_init() is a function (albeit an inline one), all calls
> within the same file end up using the same instance, effectively treating
> them all as a single lock-class.
>
> Fixes: 9464ca650008 ("net: make u64_stats_init() a function")
> Closes: https://lore.kernel.org/netdev/ea1567d9-ce66-45e6-8168-ac40a47d18=
21@roeck-us.net/
> Signed-off-by: Petr Tesarik <petr@tesarici.cz>

I thought I gave a Reviewed-by: tag already...

Reviewed-by: Eric Dumazet <edumazet@google.com>
