Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10F5156F5E
	for <regressions@lists.linux.dev>; Thu, 13 Feb 2025 15:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739460459; cv=none; b=NqVzvX84cg1Dg1WY5aznyS0SMzvdov9KuSzQbMyxL9CP7dT70xv5rFzB+ZKlbSWy4Ie08wOwhWtKyZzsNK1YeRhpz3ZhiwPSdN0eOXr1Y67hnQuTXM0g7s6R0bdH3HZqjb8oYBBViZjErOksGIhBJZm5alE+wmH1p7uE7VZ0bRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739460459; c=relaxed/simple;
	bh=MuP+XmkFAfCI9gqjMWhacbC6RlNrrf77w1csG5Met0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z6+6Iw830PDNn0D9Qp0DcYMeGddruEL4JnT3BJKc7sAyAwhgS9WgjPdmhtm6AhkOh4YrGqZL0FI/jpmfTS6Ce9ftG5ewC8P/c5zDxmDuc2lZw9Yx6Ysv59LeASLip6xLTHsuxj/k6pQRpuI64OHJIYw/2cHqLYLvrcE7X1ssDVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RZUcyH42; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RZUcyH42"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-721d213e2aeso310809a34.3
        for <regressions@lists.linux.dev>; Thu, 13 Feb 2025 07:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739460457; x=1740065257; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MuP+XmkFAfCI9gqjMWhacbC6RlNrrf77w1csG5Met0s=;
        b=RZUcyH42HONlWm2/nuwutKQMULV13+p2Th5iNFfscMH7hzn8NTcMGWUcY8g+2CPjzM
         ip3ls4ajyuy9e44i7y0LgJbd8iPf8pmnl/dsn4tjTktYt1Kcwg2gknFaAXbfZrsWDx5o
         PZasDYnDUgX9i8oEgEuSBiOKPgaTGmwYUX/LUk0l4oc+8t8W2QdOuZIR+mYR8mGTnasT
         eLIGaA+2DAbxbGW9ikWGtafjSi19H7fopPyBEHJzCj0pkRmeNGVIKu81vluOrjEg4ZvM
         IznCgJqEy8UQ475Ho9GmbAQFRvh2wjSI1RZJbZk2jzGq+o2yKLnjgDPL5ATL4otM12+o
         aGBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739460457; x=1740065257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MuP+XmkFAfCI9gqjMWhacbC6RlNrrf77w1csG5Met0s=;
        b=sbSB0jbit9T5SZqUnMdoP2vOO0gZkn6bKXwzBLk4VK5YI6AJoMbtKbBW0wYle1peHy
         Lnw/DJwD//jOypqRgbTjRNpQbz6tKxTtRypSTxoD90vYmaIzJb761RhRIii9vtCV0tf5
         3XQyQj9VG4IAt8wvC+9L0Ni/75c5aaN7MQguNBeosbDtTXVXVwD7Up+hxbHrXPab7LeW
         bcnCCakTBX5/tJs4YNi1IRyYMOX+QH4Cq6e/oh33owinbMVw4jlN9BsZpWe+Z7RyLNWH
         jio7Czq7AV1ftidCtWOoJ04T/keGrCd9IWF33LNXFbdNB3M6hANHAeL5W0uBOFW+trKA
         +m0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUAW+5hyXGPOnWO+hH5Zb2htas9lNy68sRHiKAd5p0MziFFxG0gxKQVdahQu3JOivrM9Fuq2FKawacr+g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxBUEnQbCb/+VWnEv3CZ+2Q6Cm4kxfdWiqYgdzwMLCCXETOTd/O
	PdPWJ32ta2MDZDIGy977n5p4JSXr2Ss05Z/3ih5vq7NUbQ7cEuUuSazEuNdYZLkPC7kDdK0T4zJ
	we4hlJVGdTneexQx4VO726bYNwYo=
X-Gm-Gg: ASbGnctlzlXk4LAZJLXdxeiipbeRDT9V0Y9juM/NNwze6t/TOriWbqDMpjuq6vcW34D
	9S820PzQ4c2Z4HeXvATcL2To+ckJJrCmT5r4h3tvpPVpVjWHpDJ0dhEhcqJRTJECxsYgNwUC+1Z
	c=
X-Google-Smtp-Source: AGHT+IHMXUwmI/PVw+wJieNWH/dKc/pl6QNWwBDvTkzNh0bPHVCVw8B+ttVQAi+r7a8Hj92o5/2R6JVC3hzPvvkDdcI=
X-Received: by 2002:a05:6830:3c84:b0:726:fca9:bb9 with SMTP id
 46e09a7af769-726fe76785emr2517272a34.5.1739460456672; Thu, 13 Feb 2025
 07:27:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsMnkng1vqZ_8ODeFrynL1sskce1SWGskHtrHLmGo5qfDA@mail.gmail.com>
 <9f3ad2da-3a85-4b1e-94b5-968a34ee7a7a@oracle.com>
In-Reply-To: <9f3ad2da-3a85-4b1e-94b5-968a34ee7a7a@oracle.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Thu, 13 Feb 2025 20:27:24 +0500
X-Gm-Features: AWEUYZnqOhkmMlR-uyVrXGvAiRy96jCtbuqAhyRMQ3CgIDqFoSRRt7ZCb3imdZo
Message-ID: <CABXGCsP9vPxu=hN5CO5MPJ5QVNJURKsBbbeb-NLoq60=M=CN3Q@mail.gmail.com>
Subject: Re: 6.14/regression/bisected - commit b9b588f22a0c somehow broke HW
 acceleration in the Google Chrome
To: Chuck Lever <chuck.lever@oracle.com>
Cc: brauner@kernel.org, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, linux-fsdevel@vger.kernel.org, 
	chromium-dev@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2025 at 7:18=E2=80=AFPM Chuck Lever <chuck.lever@oracle.com=
> wrote:
> I need a simpler reproducer, please. "Chrome stopped working" doesn't
> give me anything actionable.
>

After applying commit b9b588f22a0c, the internal page chrome://gpu/ in
Google Chrome indicates that GPU acceleration is no longer functional.
I apologize, but as I am not a Google Chrome engineer, I have no idea
how to create more clean reproducer code.
I only noticed as a Web browser user that when I scrolled through
pages with a lot of images, Google Chrome got substantially sluggish.
Hopefully, someone from chromium-dev will read my message and help us.

--=20
Best Regards,
Mike Gavrilov.
