Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EDC10E5
	for <regressions@lists.linux.dev>; Tue,  8 Apr 2025 08:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102230; cv=none; b=O2UJEI4n1sC2rM2jxFCLlVBprVXXzXUllZ3jDp/Vi7+uJuiO0hIp6B5CRBJlFOWr1FwhIoQFvoSwGGPvQN+x0GP5n3wfd8ivihUTTIXvLk6FXvKDTo07kWp2/7TuZ85whkfxVZJ43gFtqodjk9cLPnjuDpei74QrD/dJMPgG9fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102230; c=relaxed/simple;
	bh=kvno2XNJCoOEd8y7jk1x51GXvEbEnR/POktSN1aDqNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PEgfwFquqlDzWQEFqAKdC7k2IDF6hB3lL4cPM5txUpB+INKKlTOmw6uG9HuB6dDwjmW5+4JyFnaunIHiUMQQe3vYn8KUdotqBJmH78DhTG4c6sB/b3QR1yV6McH2KQyOoUHTIc0iNsaKqwqmqwQ91hXG2TkeuhrPcvD9pK9hbtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GnB9DkqG; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GnB9DkqG"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2c77a5747e0so2906529fac.2
        for <regressions@lists.linux.dev>; Tue, 08 Apr 2025 01:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744102227; x=1744707027; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kvno2XNJCoOEd8y7jk1x51GXvEbEnR/POktSN1aDqNU=;
        b=GnB9DkqGNZsVH5mPn6p+40YFpTkoCZmdjv5HW+24FuaIfm55pj+3JbvdrxbAKvI+oS
         AIluuY409oMN7Q0vbrq10iDPixB7K5Pji+pAQoQ5MuaZ9CTeoNFdW+hc8Tv5m148Stdo
         ZEHZIxKQ8brX/RV3k+dt4LVElg2WyMcSUAdboUO/QmvqIoXRoyGpFe6N0hh5rxGMsXgj
         ZG+sPDWNBb4iCMZytCsHjwxbnqg936lRTzYq3UJhZmzqfbLZxp3eLJ5MsBIcqlpuR5r4
         AaybkVAPjsGzkChMS1JH2ZP8jE8vDvL55X88Vehpk2yYpbv/rqjNCgxAixMg93cRYfnt
         ykWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744102227; x=1744707027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kvno2XNJCoOEd8y7jk1x51GXvEbEnR/POktSN1aDqNU=;
        b=cFqHofip6VJHG3r123FAj35Ze98EbjNMcXZNiUXuraL0ElMELmN5beaNssAPx/UCB5
         Ll7wRmTVR2ztjU5EFsoSfRw4JBX36s8LUK8IIsfj9G+5HpQy7fC6ftvb26h9rxKoUJz1
         he8JRFbT9eziaqhw8IhwP+6tYmENIKT5zAAGrOX9WiZQmP9R20J7E5wzjRgLy8dYIhph
         q7vGvH7J134wBUxTLCrMb4/oC2y5DIruG5JQZf8jbkiHfXDd/mGJLQsxOaBxIc6rzk/2
         jfRATW4cNmrndqb70nGN9Zkk3xc0N1HrQ8gDmp0itpCJo7VBHO7dsrz5vRTBEfzn1xpg
         F2Sw==
X-Forwarded-Encrypted: i=1; AJvYcCUEH/87QhDHTkL4LsFY9D1VmZkGvu8x5CNL2kYf/Gm7nDnMPXPgidYrnozHZOwKbwSzRCh/xeW1dug48Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwnIIKh2rnXcZlywjJS1YtEnS2fiJ2tuIeU1QkMNCTRtsMHxyqL
	VfWTuwn8ikF2d9HdvjJW1ybIst/nA1eJxibDAS9P/spU74EObduY4hd8zJ4waR1eQkWBryV0u+D
	z8ZHircNmrZWNtnA1lKGYuPH67nA=
X-Gm-Gg: ASbGncucGm6kLrPRxWRjg7dqyCLjM5aIbKEeBrTW2ft/f/RPwXw/KA3j4tkn5zWl1sr
	POcWF2y2C2N4hblNaOffQD0eT6vm5mPWs0CgcTiWxVhurYxKEzqrirEo1i/RxjqshEVFXbNJk+d
	i2WrA/3uHLHvJcco2LHk+MKRifoOkt
X-Google-Smtp-Source: AGHT+IElkjUVk8HyJcE/EurtA3ynUdnQAqCdAv+9kFaWS45a0PKPx3vJizRsJE1zRkqykB+F2L+uvgSw4iddQc7pA0Q=
X-Received: by 2002:a05:6870:3306:b0:2cc:b75b:402f with SMTP id
 586e51a60fabf-2cd331bf9femr6272351fac.38.1744102227293; Tue, 08 Apr 2025
 01:50:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsPXitW-5USFdP4fTGt5vh5J8MRZV+8J873tn7NYXU61wQ@mail.gmail.com>
 <20250407-unmodern-abkam-ce0395573fc2@brauner> <CABXGCsNk2ycAKBtOG6fum016sa_-O9kD04betBVyiUTWwuBqsQ@mail.gmail.com>
 <20250408-regal-kommt-724350b8a186@brauner>
In-Reply-To: <20250408-regal-kommt-724350b8a186@brauner>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Tue, 8 Apr 2025 13:50:16 +0500
X-Gm-Features: ATxdqUGvyU9DVooNsVhuGwxOSXydA50hfWufsPqasDOcq_Gl5FeYL9J7OVH_a4Y
Message-ID: <CABXGCsPzb3KzJQph_PCg6N7526FEMqtidejNRZ0heF6Mv2xwdA@mail.gmail.com>
Subject: Re: 6.15-rc1/regression/bisected - commit 474f7825d533 is broke
 systemd-nspawn on my system
To: Christian Brauner <brauner@kernel.org>
Cc: sforshee@kernel.org, linux-fsdevel@vger.kernel.org, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, lennart@poettering.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 1:24=E2=80=AFPM Christian Brauner <brauner@kernel.or=
g> wrote:
>
> I have a hard time seeing what that would caused by. I'll try to look
> into it but it's not a lot to go by and this just shows a hanging FUSE
> request which seems very unrelated to the change you point to.
>

I could perform another bisect and identify the subsequent commit that
caused the issue if I could revert 474f7825d533.

--=20
Best Regards,
Mike Gavrilov.
