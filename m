Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB1613A884
	for <regressions@lists.linux.dev>; Mon,  3 Jun 2024 19:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717442852; cv=none; b=b0uymTbWa0KwM/zVNxU+a5a4WBA2IwKRbpjE2YtMwoyJihNxA+UxJIDduMnsmiPsN7A0QOirgSskcJsBOcGKwnkOBeiU92m4NcDkbrNgN7uIo37Yb3uyRRH+C+1j8+MHOjd4VZeBaS1s9rHbqZo6A1aAdkhkpuVrXox3vf8wGF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717442852; c=relaxed/simple;
	bh=zHBew3/4XvlX7DPUyObelgFA3gKLgwQx1HhE9NyOhss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E3rlDbm1zHZ2uO0aobFxr52lXNMImQqO/XZw8aBqI/xnEFs2tDza9dv1OvVnfadMyR4r5Z0bezzRs3A09Xc0HeTdMfOOMbckxinWGDisDZ3N5q4GkmQRN0SQgEpjBGBjrNgpIBrK3XZhkbThpEy81M/tRjjXYVwxZhfLEYuUYlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5KKOKcj; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5KKOKcj"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2e72224c395so42546751fa.3
        for <regressions@lists.linux.dev>; Mon, 03 Jun 2024 12:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717442849; x=1718047649; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zHBew3/4XvlX7DPUyObelgFA3gKLgwQx1HhE9NyOhss=;
        b=B5KKOKcjebary2R+KtLgr3SgJzeipKBW/bqSEppUCsDb12G2oJcrm1Y7I+EjfZXxxm
         9wr4/9J4eXk42nf7ULKZQfHTWv+N+aSYKGbxvEilfpARhNLVZMLhbUs2VJxs0z4k8NLc
         30M9BgAHsverTYauyZVwACQFxLOvGTyAHXR0TIVG2wQ5V5LssTAXaY+krkL2CAA60wfZ
         A8VCZLfxaG9t4G96JPUJvt6jwErYKnLk454qNwHEmoa4Xut7c5X/iea1+cLNDx6eSqQJ
         uSlcQy+GlMcMOxL3eXYLTGZjBvnxUS8RHX/y4buqsYv4zcpN8cHJdvNp4wrk5LN68iOi
         xTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717442849; x=1718047649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHBew3/4XvlX7DPUyObelgFA3gKLgwQx1HhE9NyOhss=;
        b=qfUNWXsl67XBi7qQhEDJMHftKh3ISaCJjCEQcGAYib1SOvQ/7MRQQJYQXUPdAc1fj1
         o85aSeSSmFk4rvxyibUmgytcvFPWNw9S2XBS8u6oGhTQPjmiYjS+v0z0SLqFQKiyIk07
         UOLr2X2Q/RgtWrnih3+IhugflVVeWsVgMqYvAXHmUvtRtdJjdpC9ozut3wfYuwUoGrdx
         SJwcMl8ylo64MaP4ERpJZFYcXEHt0DJyAv20UprXZ4Xlpau3VhUPGYbPyP2PQEhnwN8R
         3NVL/soaHkkybnAUxyuiAi3QoGqCnEFQtv2/4Djy9u7Z5gRRYYdtCEUtwtctEk/QEWwh
         l2/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUmBIY6Xa++A6NG3Fn7npVlrYcVcx6Jksf+eSKtlpYFZklWzgLCgaMhRxZ2/jqdnijoDM2SaphKej8GKste2mhNcJssiE3UE0SsJQI=
X-Gm-Message-State: AOJu0YwA+yB1PpVsBAmCfx/n37qkVPTgI2N3JNaHgI6bV+VwASgAGWjy
	eFMUKic7wQBRSbJqNRYnJMxOFOZ+Ge0hc91IfYRvgJFbryUBXd2plzAfELHkEGk3zLflnmC0yYV
	y7pxJ5CqAF+xiEtwshD2xsqM33eI=
X-Google-Smtp-Source: AGHT+IEMCIWO8m3KqWtZP8FrbUCeQ0EQAQC7aiQdiNSAJLCQDfTPbR8AIlXxxwTHlztCf2EwhJLKaH/iS5/dnsPYIsQ=
X-Received: by 2002:a2e:9018:0:b0:2ea:3216:7af8 with SMTP id
 38308e7fff4ca-2ea951220f3mr60163221fa.28.1717442849212; Mon, 03 Jun 2024
 12:27:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1715866294-1549-1-git-send-email-quic_zijuhu@quicinc.com>
 <f343ecae-efee-4bdc-ac38-89b614e081b5@163.com> <CABBYNZ+nLgozYxL=znsXrg0qoz-ENgSBwcPzY-KrBnVJJut8Kw@mail.gmail.com>
 <34a8e7c3-8843-4f07-9eef-72fb1f8e9378@163.com> <CABBYNZLzTcnXP3bKdQB3wdBCMgCJrqu=jXQ91ws6+c1mioYt9A@mail.gmail.com>
 <f7a408b4-ccef-4a4c-a919-df501cf3e878@163.com> <ca7adc9d-9df3-4050-8943-3c489097b995@163.com>
In-Reply-To: <ca7adc9d-9df3-4050-8943-3c489097b995@163.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 3 Jun 2024 15:27:16 -0400
Message-ID: <CABBYNZJwPr_1u+NYnAVaPOd+Wkrb9Jz40hjWF_8v6p6tTaZjtg@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: qca: Fix BT enable failure again for
 QCA6390 after warm reboot
To: Lk Sii <lk_sii@163.com>
Cc: Zijun Hu <quic_zijuhu@quicinc.com>, luiz.von.dentz@intel.com, marcel@holtmann.org, 
	linux-bluetooth@vger.kernel.org, wt@penguintechs.org, 
	regressions@lists.linux.dev, pmenzel@molgen.mpg.de, 
	krzysztof.kozlowski@linaro.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 30, 2024 at 9:34=E2=80=AFAM Lk Sii <lk_sii@163.com> wrote:
> @Luiz:
> do you have any other concerns?
> how to move forward ?

Well I was expecting some answer to Krzysztof comments:

No, test it on the mainline and answer finally, after *five* tries, which
kernel and which hardware did you use for testing this.

--=20
Luiz Augusto von Dentz
