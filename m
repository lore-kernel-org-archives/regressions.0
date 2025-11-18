Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A9F335567
	for <regressions@lists.linux.dev>; Tue, 18 Nov 2025 11:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763464459; cv=none; b=NlDNjRQ/tPcsaOt4r11i+QAq7M4+cEyYWxzC9KP0REJDHvnWK0lNgyqW3ZXvhywddmxmzUnAApnARRsd+CRXlMQZLZ4arKgFcn9+V9Jw13dUwv7yZNLaiwtmQQ6VoGA1qcYjCjTxE24TJGJvg14IJI/7L11l1q7RSTDLaJAHZ1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763464459; c=relaxed/simple;
	bh=gG1FbeW5+OEWqmHXLxGf5HeKtxyfdhB+HR6dfyZtLR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cAiIOd8wp6MHoSOxoHlzryjPq01ifsgxoi8bsiUM8RrOmgIRN8TQraqirMInr1iz5JqOIm7K49AeE1coGX7PbmyZY2cBfbLyf16rOCGNiIDFmbYi00oDccqFRv0hj6YHfgD7p9qYG4W4MNEMAfn1ulfpc2RMbJoYWPk7/NbzPFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=XQ9b9AMG; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="XQ9b9AMG"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-88246676008so60838556d6.3
        for <regressions@lists.linux.dev>; Tue, 18 Nov 2025 03:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1763464455; x=1764069255; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eNChZUVPn/cW4SQ7AGa5/zB9gn37VAtjKhRDFWpUR4E=;
        b=XQ9b9AMG/vOj68GWT4i1bpanUseLDUaNpr7wB86wWeXCzFeyVTlOatH2hr1Byy/o2s
         2jvI1eqMPa0EHLe1XtmcvwsdFtM+Ao6YMtmpZD5w6fmYMkpOWoVgvlR20t+HUcQlVkEY
         SF6LY1iFmDzWXj6EDaSFhnvQsvMM4vVJEM2vg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763464455; x=1764069255;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eNChZUVPn/cW4SQ7AGa5/zB9gn37VAtjKhRDFWpUR4E=;
        b=OHf3D/VhE3zMtBVZ3R3MNUNZKay+Aiqg2kf338cIoWSZbDRT6ttNdy7qthkBh1jFmf
         L9dBXyHDjuhtMrqhHP1gqk8FAjK/8DDT2IQpr7s25Qd5QnaHFknsjQ8jmBlPYB1wAaY/
         f9MU6UzRyufF4eIx4D4DN3auKL4sii0A8uXHiuut0wfK1TNTH82M0rZ8upBMWhaJfA9q
         Gl44zJi7Hbzrt4IDDrJv+OQV6os43b/dmIpPI/WxXeQ9BlTDpAjF+u+QarxVvGrCrc8B
         hmg/QnQlSx/9aIPs20+fk+c3Dz7N1/kWQeGDEAdihAEAvRBry0tTVfzq63knOsuqU6/N
         owOw==
X-Forwarded-Encrypted: i=1; AJvYcCXIbqQmZtNpbrJ+/mzZSAw6AWb+QBCr1qM67nAo8lq4t0LaeCpYvH5rZGo6E0SaCz+vU+3N6ZqxUJxTvA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxMSMDiUcGFWkxkcStZXdDC7B7i30K3H63Whfnb7jzwcq4fY9+2
	+6Y/ID3aiUzX9crS8ozXeo3eoO7zDCt7fl77qabDBzD6JXmH0Id1/gQOzWhM/xYOuQNpgkJTzM3
	AArBBXk89geUJJ8nu51eqJWI9dM3KgqvuUEbAnmkfrw==
X-Gm-Gg: ASbGnctWpDCbBCEARFC1vjcSJet2TMUBV3E2tLCS3nADu6bc0Ds2VEESl6e0ZgkcUIV
	MbKRiM32UEfm9hwaJip99zSruol5pCuiDJgcnfBplyQAi0j6qozmH4ggYcWncZdDxoQLkJSEO1B
	5wh7sIYzMzjPulTrgotcRHkMzfsfzHpWtlR6kmJ+eGQ2189NGXx8iYSgKDf/treULjdV7fLkwCQ
	PRzLw/H3ry2n5DlJwYHcN7J1J3BhGKldJvMwG+NI4dsVWrZG+3FJSVrv9h72nqW5waixJ8=
X-Google-Smtp-Source: AGHT+IF0vAvRC3v4QI+HG+O1mGSzyxBAfAe3pbg7/c8kxZDknthzVlBk6ZIioo6+FPPOiU9/dAexIFAxys6LV/5084w=
X-Received: by 2002:a05:6214:21c1:b0:880:580e:b3e7 with SMTP id
 6a1803df08f44-8829267b4abmr221641226d6.37.1763464455033; Tue, 18 Nov 2025
 03:14:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <mwBOip3XK77dn-UJtlk-uQ1N6i3nwsKticZyQdPYzQcsk0dsjXl4oOAh-Neoxv-0TlpKnt_FEJwx8ses5VJglGLJUW-bIG8KWchtoDwCnnA=@protonmail.com>
 <CAJnrk1ZDEszGbyP4cRh7+mEPu9BLmPrY9Xb-Q3HZnxXZOV7Eag@mail.gmail.com>
 <CAJnrk1aepU0y55FNG3zDHhK4iPo80MtD+tE_PT+ExhD9SDUS_Q@mail.gmail.com>
 <_Gt41eQ_dnFbfGcMH4LkwSqmCYBdQGfnPdQfBlAWwkohIUfDUwtdvpQa61Pk2FMD4B-ov2uVIG9FUCJu_GT67Qkde7e2oZdnnRMopuglZHA=@protonmail.com>
 <CAJnrk1YhZN9=M92dK6EtTTkuhQW_qco_ikwFHmVE0cgiiUnF8g@mail.gmail.com>
In-Reply-To: <CAJnrk1YhZN9=M92dK6EtTTkuhQW_qco_ikwFHmVE0cgiiUnF8g@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 18 Nov 2025 12:14:03 +0100
X-Gm-Features: AWmQ_blrKN0f_3ReHo4Jsd5Q_sFv0SUHiM-Es1B-B3e3LJ8UDFKZwAMp19Cf_jU
Message-ID: <CAJfpegtzmMFtrg4G5N+M+0GG6QdBrSZStWN2RNO8ut-Uz7LdiA@mail.gmail.com>
Subject: Re: [REGRESSION] System hangs on suspend after using distrobox container
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Athul Krishna <athul.krishna.kr@protonmail.com>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Nov 2025 at 20:00, Joanne Koong <joannelkoong@gmail.com> wrote:

> Ok, then that means there is a buggy/stuck fuse server somewhere on
> the system that is not completing a writeback request. If we look at
> /sys/fs/fuse/connections/*/waiting  and see "waiting" stuck at a
> non-zero value, then that should tell us which server is stuck.

SysRq-t might also tell us where the server got stuck.

> Hmm, I don't think this is a regression because the bug is in
> userspace and for a functioning fuse server, the new behavior is more

Userspace acting strangely is not an excuse for counting something as
a regression.   The rule is:  if a practical use case  worked on
kernel version X and didn't work on X + 1, then it's a regression and
must be fixed.   And the report does look like a real life use case,
not something made up.

Thanks,
Miklos
