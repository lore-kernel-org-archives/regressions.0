Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97328343D79
	for <regressions@lists.linux.dev>; Wed, 12 Nov 2025 18:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762973438; cv=none; b=a8TykA+mZghQt2/OmVZP8BjLOHtLmI19iCLHSYGnZKA3NqSRQPcUasubhy7l9tdjJQp/SvS7wljRVWTn/ZbUOPl9u3Y/D6LnZVQ9r9wjyb/P3kShW9X/F/lPFA9Sfe6dfgJ/xFBcEtVP7daUFUSEQv25MDE61ateuitCQCBScoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762973438; c=relaxed/simple;
	bh=BONnWlwCaBoJ/reo5seahES3eq/cwRYq8pWWwsSLzJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LXKv7yZJACz7CTxwt1KozrzmFZnKdxldWP3Ta1arATnNqBXbdngiJiKxRQS+seJBHYKivIdM7lmPoY5dCSxxfumFLo4Gw2FgG+cQdWzYOvMCZcWrp3JLQQusi0+cdJDGTJS+cCXSgYzVx7xCClKzQK2EgRfBkgKt8klJB4jZFMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B3UYzQhu; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B3UYzQhu"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4eddfb8c7f5so8575201cf.1
        for <regressions@lists.linux.dev>; Wed, 12 Nov 2025 10:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762973435; x=1763578235; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vv7Cqn9boVnJpM+98N7OirzJ0NjpbC4XDUfsdX76HyM=;
        b=B3UYzQhuyf9vbxUN/5LV+qUvn8BU/q5HCHlX7Ne8xHTP+56A1c4MJfywywt7oQ80mK
         1s1ryCUiIwWRdR6hxWycy33sb4rXZgkldKlHkw66YSNY8SPBQHH5ar3QWt+xv56HShQ1
         WS6E5q5OYzMUJ2SSLuzIjbVD8PSixZN5uATBsJBD5eyyqAHZZCtOzbe4bzh7JcuyP8HK
         tscYI30SCL6TVnGK+prF90EnWXuO8JG/IeEy1VvXjlbbnUoj7WG2VOF6f2Bw9dCmZ3VH
         coOZsWTB2sbwrZEQGLPzNigzpz5LOPJLyG+y+prGeaP1DBBFoHwqGOsmJMwkE5jVGpmI
         huww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762973435; x=1763578235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vv7Cqn9boVnJpM+98N7OirzJ0NjpbC4XDUfsdX76HyM=;
        b=OTXOcqM1hDYQeYsRUzA62EMLC9664ITx8o2zPDUv6SvH92/ivFQdZbHikITRdCWXXN
         O8CEumbD1i5va0UjUC0rSJZptS7I9vV18cBbv4Zj4oIsVUuUL305xSoQdskljbcgLgdu
         JAxGdXRn/T3DuRpkVBBnYyb2Cv4r1ohFWZEgcIIGYWailTc/eRwSDXjqc4i+IjodUANl
         U1gNgX2pcIRWmBYHCjvw8v/NpBs29RPY+tJp9H7Vp5/oSDDR1B/8NMyngkuecef0W8c/
         SZHgMyxfdxRFBKC2G3ZQSzKd5Tz1jY81U9kiLUjM3WEmpxK5F0/kjOOSwYMnxZbTLg+2
         5+aw==
X-Gm-Message-State: AOJu0YxQuJ5nff51nb+0A2DI+n0lsSEHVpfdTS77oDbfkCV/fMY1QP1+
	tXjbk2QfK4L02FXwoVtVn0vjTJ/1MnIMYTBfi5/hAerZZ47aX0Pc/tMaePGf15TCmF9PEIqssei
	6YqCxPTorGrtZzW314RkadSnpqmL6SUA=
X-Gm-Gg: ASbGncvjjrgbcGEBgY806TN9eJ2n1uMXpTaMVMTdLpC2kkdFGKBvLqSzRieJ7+GYJHI
	oAkfA5IRU4x9wUByE6dkXzcBpFEnwqiGANStp93/RPk/kpLsrnukLGWyCPvfFYZI+kvmif2u7O+
	wgaDcDUfEMfkdZvd3qa4HzzUmvoM4IMaIrqlhJdqeAC0uQNAUcu6ZUPPXIMLJ5NFSUPBeHGMGs4
	UUBPsVAAGXiXAMCZZa/INNkWbBx4fQgcykAeL+bINeKyTdz5YLftuiIb5Q=
X-Google-Smtp-Source: AGHT+IGW0x7Prh9V2c/iJ6Vd6XIOwFucd+CDOzWzfSIc82AwVAZmaIyuL3/Ms/eVKog0i+4hamK1s9I3LmuNfe9f7Gg=
X-Received: by 2002:a05:622a:a959:b0:4ed:de14:b374 with SMTP id
 d75a77b69052e-4edde14ba74mr32635621cf.64.1762973435375; Wed, 12 Nov 2025
 10:50:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <mwBOip3XK77dn-UJtlk-uQ1N6i3nwsKticZyQdPYzQcsk0dsjXl4oOAh-Neoxv-0TlpKnt_FEJwx8ses5VJglGLJUW-bIG8KWchtoDwCnnA=@protonmail.com>
In-Reply-To: <mwBOip3XK77dn-UJtlk-uQ1N6i3nwsKticZyQdPYzQcsk0dsjXl4oOAh-Neoxv-0TlpKnt_FEJwx8ses5VJglGLJUW-bIG8KWchtoDwCnnA=@protonmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 12 Nov 2025 10:50:24 -0800
X-Gm-Features: AWmQ_blz8nvhKyeDCRNVbU1-j5El_vO_ktpOvPFPIgbVne2a6Pn1tA4PJMWvi4A
Message-ID: <CAJnrk1ZDEszGbyP4cRh7+mEPu9BLmPrY9Xb-Q3HZnxXZOV7Eag@mail.gmail.com>
Subject: Re: [REGRESSION] System hangs on suspend after using distrobox container
To: Athul Krishna <athul.krishna.kr@protonmail.com>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>, "miklos@szeredi.hu" <miklos@szeredi.hu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 10:47=E2=80=AFAM Athul Krishna
<athul.krishna.kr@protonmail.com> wrote:
>
> Device: Asus Zephyrus GA402RJ
> Distro: Arch Linux
> Kernel: 6.17.6
>
> Noticed this issue after upgrading to 6.16, systems hangs when closing th=
e lid of my laptop. The issue is triggered by using a distrobox container.
>
> Steps to replicate:
> 1. distrobox create --pull -i docker.io/library/archlinux:latest --name t=
est-container --home ~/Containers/test-container --additional-packages "sys=
temd" --init
> 2. distrobox enter test-container
> 3. Suspend the system
>
> Bisected to commit:
>     commit 0c58a97f919c24fe4245015f4375a39ff05665b6
>     Author: Joanne Koong <joannelkoong@gmail.com>
>     Date:   Mon Apr 14 15:22:10 2025 -0700
>
>         fuse: remove tmp folio for writebacks and internal rb tree
>
> I was able to temporarily fix the issue on 6.16 by reverting 0c58a97f and=
 7d0f0f06. Unfortunately reverting 0c58a97f on 6.17 causes huge conflicts.
> Attached systemd journal logs.

I missed this in my inbox until I saw Miklos's reply a few hours ago.
Sorry about that.

I'll try to get this set up on my VM and see if I can repro it. Does
that distrobox command you wrote out in step 1) automatically run the
fuse servers on the container as well? And for step 3) are you
suspending the system with 'systemctl suspend' or are you doing it
some other way?

From the logs, it looks like it's stuck waiting on folio writeback. Is
there a stuck fuse server somewhere that's not completing the
writeback request?

Thanks,
Joanne
>
> Regards,
> Athul
