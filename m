Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C426D4CB35
	for <regressions@lists.linux.dev>; Sun,  9 Jun 2024 21:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717967964; cv=none; b=GBfnVCxc+2sI4WcxhGDWutHvZ+0WW6oukLM0QVWD+E1A/nq9wLjFHKOXc+PjQVMBoF9m3JRs3JLwe6ZEESR7CyL3vY6guRwzcTv0VDGCNTqEDAOhCa049hsJH6LheO35eGfMttax4Ah3LRJrsR6qbnDN3FFZgupkDp4uVWV7d0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717967964; c=relaxed/simple;
	bh=HX2XAmEvsaxz+2HYHmqHKz1Fr8D6ko3MZPqGdH9cGJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lgyYlRJ6PVL57LiZ/TT+uy6FxO3XqeTtZc5E1lz+fox2yqIcyfEvNHBFTD5DP5naxREIIGGFtszwp9xQTITxVVvFvd5qH424y59dSiNloP4huxYckf4deaTyFp2N770TId7fnte8/5H9ZwpsDQmIoJptdjFBmnFRRCoObBGOkDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qn1pd5gM; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qn1pd5gM"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6b075bad08bso582036d6.3
        for <regressions@lists.linux.dev>; Sun, 09 Jun 2024 14:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717967962; x=1718572762; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HFOvTdjQjjhoh4wsKRpCaTJdsFlZLtgchfZ+i+kPTAg=;
        b=Qn1pd5gMgatljuv1+ypL1mgAwY5wUkMMfHfUIEsd+z8pQ9d0sP234ESwSZ6OOd8XDS
         BiikOnJIJWoj6VyrvwPRr+ufUU1HmC9evNsYcf/oWpaNan/kfnnLam+EMPR5Eujs4gPz
         orkUX2VNkkCDE4zzZeAtixn5aI7pyxkeJ1DEnQvzZeghofEObB+rtpNfTUJMJbi4GlNs
         R73Yr7hcVG74OOES7vwvo+fv3vkeOSAplKGSVmV+++jpBJIOMR3YCA5CaVHFBGSS2Ygv
         JJ+yNJ5hCD/idIqe4C1kSHQhl5DjQN6JxS1xj22v6YHMdVWxmaEAbKhq4Xp12u1Eh6VF
         rnHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717967962; x=1718572762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HFOvTdjQjjhoh4wsKRpCaTJdsFlZLtgchfZ+i+kPTAg=;
        b=H0XFIOryZAihl8gCm7ZWl/shyyoLXpzQisWe7Nmb7gu3YzBC9FC9xArs5bOcY1I+ey
         ZdwtxjP2uxsTBOYMuIc3dmVRSylVR2Sip6/3dmO9jiN9fgg70mTi3NKt558l1dokVsxM
         oMexgH9xauB4Z0uM07nFjggTk9/PoU55+B8XWUL98Vvp7HB4J0NroYP1A8nIgch51gbz
         6c6+vr03baSNNpdTbg40YmDlTEcLwPX/nWctRtdHZb9wJMqebUmxWWRLo0j6LNPRD9lW
         A/MF1tBCJFW1Dw/pH5elekcOFunqUgaagzVfChouOSjK4e91ZwE1OrdseGZigF38jEHt
         5+Ww==
X-Forwarded-Encrypted: i=1; AJvYcCXQOA2vg1Bx3Su2SO5V119nQ+MP0vUfdVpHSl5RjBtlxjlaSpeQCuNkR0G6BRokI4NXQzkToia26t60yFLEQR5vuODYc2rHsuuOJus=
X-Gm-Message-State: AOJu0YwU9EBh5HxFqeBKdZ1tkOkC+apbzifuK9fR9+9JGB3Rsl9rWBH3
	dC6MKNBRIOG9iQRxH7Vo0bEPxtoN1kovc0lunGuifIeXuYowrgCIvxCeof6W8+xOwBwZara2rvS
	NHbDq7yShqNaiZ8q9R4fQCRRzl0M=
X-Google-Smtp-Source: AGHT+IHVRz+3tbYJAWHmxuulkifl8hVs+5TI6OkCO7MdTRYn7FXiijjkzZmf4d5Z+6MXekrvUQQFP9LP3HkDuvHn8H4=
X-Received: by 2002:a05:6214:27c9:b0:6b0:7369:e747 with SMTP id
 6a1803df08f44-6b07369e7e8mr33592676d6.2.1717967961699; Sun, 09 Jun 2024
 14:19:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsNptxsQO=5=qi-JYiFX=rX8Ok5inK80Gn0qrUFWbtBGng@mail.gmail.com>
 <CADnq5_PDxJ8O1JUQ9RBYRFB9G1WZJos05ZAM4jUKuPBwPxjNkA@mail.gmail.com>
In-Reply-To: <CADnq5_PDxJ8O1JUQ9RBYRFB9G1WZJos05ZAM4jUKuPBwPxjNkA@mail.gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Mon, 10 Jun 2024 02:19:10 +0500
Message-ID: <CABXGCsNN9LwHc2x2AAEH=5UNwpvkWkBqRYz3OP8MZ6Woy+HDXA@mail.gmail.com>
Subject: Re: 6.10/bisected/regression - commits bc87d666c05 and 6d4279cb99ac
 cause appearing green flashing bar on top of screen on Radeon 6900XT and 120Hz
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>, Rodrigo.Siqueira@amd.com, 
	"Deucher, Alexander" <alexander.deucher@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 7, 2024 at 6:39=E2=80=AFPM Alex Deucher <alexdeucher@gmail.com>=
 wrote:
>
> --- a/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
> +++ b/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
> @@ -944,7 +944,7 @@ void optc1_set_drr(
>                                 OTG_V_TOTAL_MAX_SEL, 1,
>                                 OTG_FORCE_LOCK_ON_EVENT, 0,
>                                 OTG_SET_V_TOTAL_MIN_MASK_EN, 0,
> -                               OTG_SET_V_TOTAL_MIN_MASK, 0);
> +                               OTG_SET_V_TOTAL_MIN_MASK, (1 << 1)); /* T=
RIGA */
>
>                 // Setup manual flow control for EOF via TRIG_A
>                 optc->funcs->setup_manual_trigger(optc);

Thanks, Alex.
I applied this patch on top of 771ed66105de and unfortunately the
issue is not fixed.
I saw a green flashing bar on top of the screen again.

--=20
Best Regards,
Mike Gavrilov.
