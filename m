Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF18E4A386A
	for <regressions@lists.linux.dev>; Tue,  1 Sep 2026 20:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788295155; cv=pass; b=DbgVG6/xBxyZ/x79oDRdH1SwKBXSQ1lxL9e3qcAsb/LtdzT/fYmJ15O/gSDNxlgk+pH+JWhCFTY8yVkq0bAZY8uJ1JxIXa5uGHo7QkGVOB5qhlt83nXQKovK0vLlEATGahQFpKDsrcEXhJa2HDRKrXEPUR93OhUt9lNGN9w6PVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788295155; c=relaxed/simple;
	bh=zMXQqnAx/G3j/QNYM2LWpXw58ytOME0jkznw3ohEhIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BeKi/5LriI+mGo127u6TnBFwzXigyDy1nG9nF4+6QskyPQl019mvQ3C+NUDMF3sEtbiQTIW0e26evSvJx9u4yvmwrlOyz3qZywJu/Wf6o5EgcRaJxgPE/EShf55AZysioDC6hc3924chEfNqXYj/Hbxz0FQZYU9VsKCzRkvWtAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V1ojasBM; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1ojasBM"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a6108734d5so434111a12.3
        for <regressions@lists.linux.dev>; Tue, 01 Sep 2026 13:39:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788295152; cv=none;
        d=google.com; s=arc-20260327;
        b=mpu/AezEOFnVfcSWyqi3fjhWTBlQnBoP5ZKvqYPFL6/ExcZeDr6LI+YVzWYo09zSuq
         9cLmL/HR7Cp9NAOSTZoyLnOOc+C4vEeRe0sGHiVtiStbqXdy0vzzhWsHo/j2uaBudR/g
         vVJqKEoiaPspOHA4yL/G2SxWg/3y1bulxaK2FF6PsbZ7RnkNb6+174fRdLykrildMGHg
         xiqGkevviIn6sU6fmGRwQcb+kj5k5aHLmccwx1QpkG8TQGPAdfIMwgGwTE0RxSxqUzQr
         WWaZ7yQkemEea0nzUU2GBw65ZlsfBC7VQDI/uN2+Ad0uW70Qp+ESOhR18OG/V1Ge6H1+
         CQFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iMSVbAMMClabJnl3yUfS4i27AaasElWu73GA2BM0Mik=;
        fh=MbV4URFUAG5I9NwqCkwjojh6h+rA6VMvVPUxM0te6e0=;
        b=Uyl/i7HbXAUcAK9uUbyyPyTE0PSsANSuj9mArrmTzceaugDT4KBADNziabpFEXldKm
         ec/ZCW5btsYOuVFFKWKWsZSmJbcNrhLFqHCn9V5TwZtI23UPwarjufVcN+V3mgIQV9Eu
         2KZrA/Hjexy88DZ2+XPqJwE0mkYWSItEg4alGyIh/PRdtB1Gc2vNr9n+J5HSwmfovkjK
         gb0/P6APH/v0mCp+WnfiE8sdHsUYjSSzK7ODSMRjH5gjgNLY8/OgGP6WHfsNCvJwCUVM
         ctKbyEQpWSkpWxOZIsIiAP1qvrXa7kGQvRedmAEmTn4ptAt180Hxy/FEEaIK7fbJ1gvk
         9s2A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788295152; x=1788899952; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iMSVbAMMClabJnl3yUfS4i27AaasElWu73GA2BM0Mik=;
        b=V1ojasBMMT/QnGdZaWzmmAqYUS+6BtvZ59HkAZgNvVm5koyezOESVwp5hfDYFjiThm
         JPuYagwTRTxiAakiW9v10IeTBeK/EZMaETtAFWu9qMbltHVQludxd9xPE64LA7LMwBbu
         /f9d8b0tXU4Wh2fZs67nkMT08xBjEXz3Wkw+giA6X1L8sOy008GlgHCeg87UdWxZYcNo
         mH9ybl46NUkaAE4oWsGzw8VZGD2G+vFRDIqrDtaw3Zu5tR3LHb47Iak22WgU/ui9YHNv
         ItT1NMEuqA5bl6qWxgu89kBmQmUjJvcnPFfgqkkJlVVi3wf1DOgBm2FtziTghO/umLPU
         yB6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788295152; x=1788899952;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iMSVbAMMClabJnl3yUfS4i27AaasElWu73GA2BM0Mik=;
        b=G6M5/B4npqXpvPLhPZYpt+T+7+rqJ3VfFrbXusf9iHOCZo8ITe2Ve4DCH/GVIAztGz
         LduSiqLPnkdJOd98MXkzrZ6opQ5Wu2rcf27j1X7jWGWpynvntMaEbY90xQn4P4TQG1rd
         KWQ/ylRIaAPeuEBi4Qr5xbhH0em6o+gKyRA96Gb2Lov6/R39jzWzcJf0r/QJsvfd0v8z
         RcY7vWh8uq+kAXjlMU2nRko+IlvJ6bKa/gl8BabBoriXVLUPFsrBTBTIvOq2uyZQei7X
         KY2PHDy2PmJXIg+jvS5u5VU6vCelz41+ZVje5K5G4x7JcqeDCGDqiG4UafYvWAMw47/4
         3h4A==
X-Forwarded-Encrypted: i=1; AKwUvBwsbqxybapU/n3ftmXkVnSy14GyhTKNzWIzNyeaFic8aEFRUkHb44nr871ajmpIWB+NAdEqBq94m4isVQ==@lists.linux.dev
X-Gm-Message-State: AFuF++kS4oKcRR6GGbX5WvkjUGfpvKzkS1bULvQiqQSRGY/rhuWKOA9c
	EnyayznMbVBoxIl00VIQzHkQxSi7qXCca/VEmF414lStt1RSmAg8km5SGvtQ813dogH5TAV/eqi
	GS6aU66X4gnkLOkaB3AUMbERFYKbG5u+HJA==
X-Gm-Gg: AYBFou1VB40VfzItMfFkaS9DML9UVPAHBm6qCbUURGineKW/5+oAiAAjYnoDWQsrvl3
	9Gxvw5J4wjBY513Ps9weZxfTNH4eSSNonVHOvTaPTzOmh9cthH3TUl8A3vp+9majwt6CmUIs3KC
	s3mSBmwaNbHquO9vHGTRWsGkS8s7ptR9SQJ/g15KOq7wFYfCFQvlLxo2Y3P0mJpg7RMPNanSaS7
	IiczwTTvULDTBD22+zwxoaS8tVpHcTvMyUz6DZBYDQ60q6DKSY0zwVCNLuNvimeI8fpD0VoZCs2
	V8M9yFsgh/DsRdYai5h9rm2fpX7LB0FfGdK2IGiXs6oIiniZQa4r7sSlav1FUzYUqbWUdIx9+Gi
	62Nm7Ou+Rf0VnThmUY/jUkQQ7V8pnYWYyfX9aOt4NIaFi5MFl63QOsFkjn+C9HM+ZvzZsENLwNu
	jxl4cbx38dpcs7kLNPFOE4kplxnxmVUk0jq3LV9IsooJPBg5OBQ0mSw9lcZqMLlUo/cQ==
X-Received: by 2002:a05:6402:4585:b0:6a6:776f:5859 with SMTP id
 4fb4d7f45d1cf-6a682ac2b12mr255347a12.17.1788295151738; Tue, 01 Sep 2026
 13:39:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260730204722.1101805-1-rosenp@gmail.com> <20260901194524.908240-1-ghidoliemanuele@gmail.com>
In-Reply-To: <20260901194524.908240-1-ghidoliemanuele@gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 1 Sep 2026 13:39:00 -0700
X-Gm-Features: AcwNN1WlvzKl5Ma1R8rX-hNwpVEErP-nMy6eoOGTbH_FUp8tWYaCb1AqEhDSbAA
Message-ID: <CAKxU2N9rW7PpNqUX0w8AR1Doc=LrRPJNct0rYJCTOm3Vskd7Qg@mail.gmail.com>
Subject: Re: [PATCH] crypto: caam: simplify probe resource and IRQ handling
To: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, =?UTF-8?Q?Horia_Geant=C4=83?= <horia.geanta@nxp.com>, 
	Pankaj Gupta <pankaj.gupta@nxp.com>, Gaurav Jain <gaurav.jain@nxp.com>, 
	"David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 12:45=E2=80=AFPM Emanuele Ghidoli
<ghidoliemanuele@gmail.com> wrote:
>
> On Thu, Jul 30, 2026 at 01:47:22PM -0700, Rosen Penev wrote:
> > Replace the open-coded platform_get_resource() plus devm_ioremap()
> > sequence with devm_platform_ioremap_resource(), which fetches the
> > resource, requests the region and maps it in one call.
> >
> > Each fsl,sec-*-job-ring node has a distinct 0x10000 reg region and
> > interrupts property, so the region reservation added by
> > devm_ioremap_resource() is exclusive and does not introduce overlap
> > failures.
>
> This patch, now commit 9a955c0a7d11 in v7.3-rc1, breaks CAAM on most i.MX
> SoCs (i.MX6, i.MX7, i.MX8). All job rings fail to probe and the machine
> loses its hardware RNG:
Sent fix.
>
>   caam_jr 30902000.jr: error -EBUSY: can't request region for resource [m=
em 0x30902000-0x30902fff]
>   caam_jr 30902000.jr: probe with driver caam_jr failed with error -16
>   caam_jr 30903000.jr: error -EBUSY: can't request region for resource [m=
em 0x30903000-0x30903fff]
>   caam_jr 30903000.jr: probe with driver caam_jr failed with error -16
>
> The job rings do not overlap each other, but they all sit inside the reg
> window of their parent fsl,sec-v4.0 node, which caam_probe() already
> reserves exclusively via devm_of_iomap() before it populates the children=
.
> So each job ring now collides with its own parent.
>
> Seen on these boards (CI/CD):
>  - apalis-imx6
>  - apalis-imx8
>  - colibri-imx6
>  - colibri-imx7
>  - colibri-imx8
>  - verdin-imx8mm
>  - verdin-imx8mp
>
> Reverting 9a955c0a7d11 on colibri-imx7 makes the errors disappear.
>
> #regzbot introduced: 9a955c0a7d11
>
> Thanks,
> Emanuele
