Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700E5126C13
	for <regressions@lists.linux.dev>; Fri, 14 Mar 2025 15:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741967841; cv=none; b=UIY/Ap8Rfrh1T8pCES2JsccZqYr9qHd8/ZDBBvp0bgtbzscIya9BJACEViPx3OJi2C1yV579d/w3hqfzSi6bSaeiBak5h4SbnlGulQZML7hkhydbR014Q0GqWg738dgQN5G41VhjAQukcP4HybUiwwiCJrNkQ8PV/y9YWdmbz4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741967841; c=relaxed/simple;
	bh=rcJWpnLUr01kVo1DM4WN2eLjI8WeysV5BASkjZ71+GE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=OT2w8GQLHgTwawTFUpzm9J12CKXLf/H+2LgkCbCRQSow13H00uB2SXNAQJsvJ8MVi7UCExEmuRJP58gc6vRRO7ec58TO+1W4Xlq7FYsjmDi0bisU+0TiQPLblxBA5MjRmRdYgQ109zkXOj/2KcCOTkDyc+LNGHdlBwaFbJNezeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gn0zLMc7; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gn0zLMc7"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e639040ec74so3069233276.1
        for <regressions@lists.linux.dev>; Fri, 14 Mar 2025 08:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741967839; x=1742572639; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rcJWpnLUr01kVo1DM4WN2eLjI8WeysV5BASkjZ71+GE=;
        b=Gn0zLMc7O8Vcziw+hqEfDwFRfVn768XraRIl+Kn5ai+e56Ctjmv4vDyTAfEfFihyYC
         cOh3xHOYbNos2prOV4JLum34KFi0+DnImWxnsgqt7GfOaTzeM8zvAhxH9fwiPz2DOMM1
         5iUADylkZeG0uTE//H4lfzzaZSJ5E6zsBwy6J4/TdYLrKMTT/jqCiqta/3P09imlCzEu
         w+5rm5wknfur5BptUoRDV9CaiCGIOJbLN5kIY+szG7T3Ygc4PhR7RjFWyINNwhBdMExg
         CggMjV9+8rkSLV3nP4fBb+GeEA1qWSR1/o7CzTgmGB0YPtZ7xAEbKE9ts7RT7g3hMkk3
         DHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741967839; x=1742572639;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rcJWpnLUr01kVo1DM4WN2eLjI8WeysV5BASkjZ71+GE=;
        b=KhlUTt0ABAMxmRz/+loBqV6DOyR3pLZ2aKeO6kssulzsEVlEUoT9oQlcYwJzhKy8Bw
         TrLi3wQbaXFmjf5U2rXUE3Gw1Fi7iiVra3ZKslbMZ/ivERsLInCn1CYZlbgluZ5K0rtc
         8fW4aSyehdyOV5bC5cVIS4pTa/wf4/CJ3tRxWuhjB3If25xPA3ItkrET4UrhNi+mnDNo
         mpK+i4SoepLWnVRn0q/G6lLFA+76rEruHFraSqZtXkOtF26L3mR43U0sdH4ixvemQiDn
         2e7HoIxtxzRNFFqRYGwLaZzb0XD6z0bpSgrZ0o68nMJLl+pTI1kZIxIrggJRa6XagP4P
         VMqg==
X-Gm-Message-State: AOJu0Yw49jDdiNT8gOmibh1C34QTeGB6m778jeezHFV0JY3CpmVKpu+u
	cXQ3J809cHwLbg4EbSPdMzDTPDBmFtoi1rfxYr8i1O71iqpgxp3VmL0v0nrbSpczKgG5vE3J21u
	R+z2FGP+Us+Kuox9EVN2qMbyAMs4tbfeZyBE=
X-Gm-Gg: ASbGnctAhJOtQcEN/Agat96LACvc2btMJmxy+FZ+l172TyxW2yDnAeqDybamInak2eo
	uN70v4fzvXANLFzH2IFcNuAluhDv8nI7NqPd/UFPzXJTEPMLfVdtaAiGN0ru/vsbRJj3TYjRtDX
	a3+PWN13s+Qlwr1ED7CVoiyhrZ
X-Google-Smtp-Source: AGHT+IFgmErDXdgNMQAJH/9kyYEMxNC7rpdKJBls8yzS9uqC7N8LsoCdBRm7JhZISardeL//s2t/KNy3ApFikjOSoU4=
X-Received: by 2002:a05:6902:2086:b0:e60:9cf6:ad89 with SMTP id
 3f1490d57ef6-e63f8926512mr3483881276.20.1741967839177; Fri, 14 Mar 2025
 08:57:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Abhivyakti Singh <abhivyaktis04@gmail.com>
Date: Fri, 14 Mar 2025 21:27:06 +0530
X-Gm-Features: AQ5f1JrPRUaG0Yf0yB6MyVqgQ5fpvbmPZzct6E6RK1UwPMaY2JOkivZoYqY8Pr0
Message-ID: <CAHDAiUrizRfUKiW6nziysk6J24TVXF+YfJAN8D4D1inZ98x5yQ@mail.gmail.com>
Subject: =?UTF-8?Q?GSoC_Aspirant_=E2=80=93_Seeking_Guidance_to_Start_Contribu?=
	=?UTF-8?Q?ting?=
To: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Linux Kernel Regressions Maintainers,

I=E2=80=99m Abhivyakti Singh, a first-year Computer Science student eager t=
o
contribute to Linux kernel development as part of my preparation for
Google Summer of Code (GSoC) 2025.

My experience includes:
- C/C++ programming
- Web development
- Linux command-line tools
- Verilog for hardware design
- Exploring Linux kernel development

I have some prior knowledge on regressions but I'm particularly
interested in understanding how regressions are identified, tracked,
and resolved. If there are any beginner-friendly issues or resources
you recommend to get started, I would greatly appreciate your
guidance.

Looking forward to learning and contributing.
Best regards,
Abhivyakti Singh
GitHub: http://github.com/just-a-coder23
LinkedIn: http://www.linkedin.com/in/abhivyakti-singh-70a98231a
