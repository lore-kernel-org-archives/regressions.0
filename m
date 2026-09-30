Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6254FD780
	for <regressions@lists.linux.dev>; Wed, 30 Sep 2026 15:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790781978; cv=pass; b=QHDRMUF2qtLgfH+h3cH2cngczW4tn030+HlfZXJCk3vQlFYv9N7urWU2+S0WD8ReKLdw1zR9xeCyTWNG0D5wuUo837JDiWaMQ7hQuh/f4BegdYsLJQwXZ2zX9ambpxWvgX+2cTd3+KrTMClpIYlOls0vOzg+IBFo5wCDUB+GxZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790781978; c=relaxed/simple;
	bh=/LS3U6D3bE8RIAvF+h1U8Lgt7te2vLbKOufwxJeZh9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lpp/rr7crA78iHJMeMrwcZtcR5IfWG3CE3sxrttc3NDuHBY/2eyhtvrGk2SYJpFCrBh4Df9zk2klWRk1zX627aasHrZlUFO1Coum9cWE4OWvGs0DyZiOav5rGveVG/QH68QQCr+g3z+K+LaXKotLwHnee8fNlc0BA9ShHDQc0iI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FZe4QSro; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FZe4QSro"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e79c06622so600127eec.3
        for <regressions@lists.linux.dev>; Wed, 30 Sep 2026 08:26:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790781970; cv=none;
        d=google.com; s=arc-20260327;
        b=CxHPfLLo4s43EKX233NMDTBTZ5PXh6CRA+IuRn55GdY+9fusVLrwg0MfTxO+BWn5Bk
         QubJujCbbD1Q1+MjDsmIUtoc9bKtGV+t3s8DgqTneDZYlflN7TUsS7aKAiuyZmjtexqM
         KM9JFbLxHABilhtnaC1rEiri4LzzNhB4OKQs7zVvuwfLCsXhjJTdq0Bg/cIVcsPM4KSd
         jbBDo/i4oeaToB0Lnv15gcXfIdcJqxCPMDh5Dd/HqOaNXwKUdEsKu/FMd/hRBcGxK8F2
         xTpxBhqN8qgOIrHqYdFz8ODcs/7MmqUrnwopdhzAbyXX/iq5zPaUWAONo6vBOo02eXIu
         VSwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/LS3U6D3bE8RIAvF+h1U8Lgt7te2vLbKOufwxJeZh9A=;
        fh=CHtgwMAltunY5Dnad77jtJ6jqb/k+UNOA31ZexSwwi8=;
        b=ngGSU2eMAp7IgeQdYJnYnBPK0hKSosf2Ix8x4YJ2ZRRa7Ql42ywbi+zb75S7+/OnDJ
         NacM7Y6nkGsKWS3GTu4wS8VqHZbnXDx/Zm0yWoSxrqPEZQIRYXsNZCPBaBhwqA1iTUYB
         VsrfQtHKqOelgZ+bRb1iCG25yu2Xyv7onFXgZJr0mLxVN5+Z56sBhdkir2KfKMAWEO1d
         RCDYyjKy7lPGUTo9oXm2XGoqQ6kBaawttTtF2GdOxuyjkvYH7jdPFRGvfIczqq5CGcKQ
         pwOZ32LvjaEWOo7qM5ly1HNUnCDDZfDDe1qdtarXtH+5RWlaTuSAipL/FA9c4QYCLcL0
         NXmQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790781970; x=1791386770; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/LS3U6D3bE8RIAvF+h1U8Lgt7te2vLbKOufwxJeZh9A=;
        b=FZe4QSro6afgs8b+AkCSwfRootwvr2yOuMPJWcpgU2nd+P6VOG2nVbs5UpiJKrNx7I
         I+E552G1CBxbKIuZN0hVYzGPdXfWN57v7Oy+4jjLskzpYg81SMqOxoE77a+NVny1Vwcb
         U2HGQjTP7biLTv2MCohjOwJcleqzTLK3f4Ub3IECysOKYfzIDy3dLlQs3yLk8MX3gCeW
         J9r18mYVYaWJ9FfmFqT8sw7PWRj/epOeBnEAmoTJPuosJ1ajOVJNM8PRKzIEg8ZIngZN
         MFVO4il66l9x9KEbVPDHWN0eA9SKyPf12mYPxT3BrR50b1ylp3CmILytRZOtruk30Acu
         HEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790781970; x=1791386770;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/LS3U6D3bE8RIAvF+h1U8Lgt7te2vLbKOufwxJeZh9A=;
        b=zookD3O1VVP1OHaHDb4MgNuEjITCDJ7U0Knah9fGJHqzFu49iqFO1en3jesEqm6sTm
         LYMQrYtJ0LqyFSyGdFO0w0Qi5HvKDqoGE2wl6281j6W3VrXyrGytliv43pcL+u4qMeax
         GnhkwFZhQpkYA10yWDUtsdLD29yuOwlqFh9/QQz1m6KLz0KqmBiP+P+nK0ws9FhAmVD5
         r1foD14n2UoG99CmxYflZVv2PxnPOp7sP8EUlqK31/OkrQu/+cNl96yL5dXudYa8kNMG
         ocnfe+uliRupHIRSSDzJ2DZMozkqt38O3//WwzLS+FfmBR0n60sNxR/+4VP5BIZAkLCF
         8jKw==
X-Forwarded-Encrypted: i=1; AKwUvBxxEV/refEq4u01t3dLYWnoLbV1QJIj3slLoZgsHpVOyoh30dYZ3Vfv3aprB43OypVZdVqYNm2scexlsg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJttTI2NBpipMVtWcj6ewh2w/CRu7xhNyrQHRkA+y1nMK6FO/kS
	6kdWvQv4PWbhSyWArhVebecQtZd3nEa1fPTlJX6FxNwGTra3UzRGcgn5MBFt56zWiOiELHmXWzD
	Tr9V2o2xSjWdoVF8+UCcyOq+0BscWl0E=
X-Gm-Gg: AYBFou3Ll0dMQ534Nnh/S+nXWhDGq8p9pGVP4fWgz3kVPT6GoUeISEZNrDiHtw5b1eh
	2k25VueoCVXfiQ2rd4sxAi+OLJe0eFDjCMebPCwLCU8338yzhoa+hMDt3AIWPPBjuChMKZ2pCWh
	dv3QDslJYMUBVOCdqMpHgAxZLU3boONj3ejs6vzOMuz7xc5MBcZ7GiwzsKY3f86t0rjr7K+ywnv
	UF8oXVLda7A9uLf7SJTt2jGDqCmSUis9O/c90C86XAgP0/BPLSalF+cXpcJwNMkamIZeFpjWZ/w
	N0jZuk6HWO+Xy9vCsJG/jzbK4vSYGRJsgb8sdtCMvfqe834z9K3TtEHUkDERnhKYwRJt4JmsDGI
	BqrKMwFEj3cDSGDo4Y+7Ex+lIfJ11X/yJrioCVaOnoQU5z4EfPzHcTjAREvKBKxa9iHEz+IEcIj
	eklLnyfZz9Q8N0ooSyR/D5R5JOAryQJ3HfWnmaT/Dd9ow7+aKxHY0=
X-Received: by 2002:a05:7300:4fa9:b0:33e:8552:6e06 with SMTP id
 5a478bee46e88-34cd6003e42mr3012710eec.0.1790781969755; Wed, 30 Sep 2026
 08:26:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260929-rust-block-for-v7-4-rc1-b4-v1-0-642a4c1aebd7@kernel.org>
 <179068244058.1205226.1765319338142659278.b4-ty@b4> <d1381ed8-eab8-4fd7-8b15-1e94876d7099@leemhuis.info>
In-Reply-To: <d1381ed8-eab8-4fd7-8b15-1e94876d7099@leemhuis.info>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 17:25:56 +0200
X-Gm-Features: AclHuK_OBw9tG-s9O8MtvXyTH10ESbf_7IiKq4RprYC7l6RRjV0_TwsAnU0VqBg
Message-ID: <CANiq72nFiT0EoL8Z9iPT3xcPWynofUAs4F2gb6-NWmUQmtBHPw@mail.gmail.com>
Subject: Re: [GIT PULL PATCH 0/9] Rust changes for v7.4-rc1
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Jens Axboe <axboe@kernel.dk>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alvin Sun <alvin.sun@linux.dev>, stable@vger.kernel.org, 
	Priya Bala Govindasamy <pgovind2@uci.edu>, Dylan Zueck <dzueck@uci.edu>, Yuan Tan <ytan089@ucr.edu>, 
	Sophon Z <aiqubits@hotmail.com>, Qingxiao Xu <qingxiao@tamu.edu>, 
	Malte Wechter <maltewechter@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linux kernel regressions list <regressions@lists.linux.dev>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 5:07=E2=80=AFPM Thorsten Leemhuis <linux@leemhuis.i=
nfo> wrote:
>
> This series showed up in next today and broke the build for me on
> various Fedora releases for aarch64 and x86_64; reverting this series
> fixed that from a quick build test limited to drivers/block/rnull/
>
> The full error msg is quote long, find the top of it below. Full log:
> https://download.copr.fedorainfracloud.org/results/@kernel-vanilla/next/f=
edora-rawhide-aarch64/11055137-next-next-all/builder-live.log.gz

Confirmed, I see it e.g. in my arm32 build.

Cheers,
Miguel
