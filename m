Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF89E149C7D
	for <regressions@lists.linux.dev>; Wed,  2 Apr 2025 13:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743601015; cv=none; b=qfBHXUdSFwfc2xfcCa6XnaTzRq1DmCRcrGrsIChDCPBdW50F15AZ5ipzqtBdObLtVGg3VJADhPH5vsBcJ203jxv+XZakDMGqgV+q2bcXgHV6QlEwaAOOmeIbjg36Vpekfq16vcIlpRrQGG0d14UlBnvAnUrFQLvTe6z1+cjYRLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743601015; c=relaxed/simple;
	bh=5faFqyoT6zo0fdQZ8vaRQbg7yHWUCkpxyPhNDEV6png=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FSJY9FfJTwKX0srfxlbsK2Sfts0STHf4ccglxZWn4AXC/4XMbuyVKpfqwS7BET+WnJdf60HXsheKx+j5fbKsLv8MfUrzYxjefWBwxIMiygSPDpRh9oEgRXD1AJ0UPuqLrrWq+a/HBjP69it3n07zTnRBvswGQ++TzEJH6PzQRXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IW6mjmNO; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IW6mjmNO"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e686d39ba2so8028051a12.2
        for <regressions@lists.linux.dev>; Wed, 02 Apr 2025 06:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743601012; x=1744205812; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6YcnQVeAyHD8E7Z9q5MeYx0CrRnuZdFDj+LArbhVdEQ=;
        b=IW6mjmNO3BMAriECDRvjyIHMJHQsA+ua5fCDDlTWbUV4TSQgY7ylxu0ap7MzLsOe8M
         M6jaRptnttvzbZsrEsWCNTIMfq9U0EJYI3aBOU70ldGJ6PBa30WDgtxdyM6MAbpFhPdQ
         wIoEu2SrDICMVSxKB/RaxXNdeUM5+WWzTUKVaYTCT3soHTspiTOdgJgmD8DzKplDrIba
         f0AR3z8ncfOryRXxbybn+LQb79+MtqrJ7YKS3JzMxbYcDq6dxXfiWaoPJa36aC2NENIj
         1odsMHj1DVXsEPAxpN7fVfiwuesILtk8gQtu3D68IWklUE1AKqOd65j5pa/c5HgBch56
         PZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743601012; x=1744205812;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6YcnQVeAyHD8E7Z9q5MeYx0CrRnuZdFDj+LArbhVdEQ=;
        b=DBRrGNfRIQqQxTOHj9hz/kq2dVCcejSYRfLqqovE9DC26Hoc8JAasszS3uxKTeVnYe
         okVlxTxkscoXwKpGcMzmrNeaYhLPb6CESEPJPvyLlD9wosccjpiC8tQ+NI8yICp9YXsc
         IoY4xW57cBhug1+mjtJNQsvoCqtKGU1R4Q/hph3NHsPwh5Um++BFw/1FSALrlNlwXhpE
         oIwJpddvqDZ05e8c2nK1WMFdeClBIQ4iYVL5VUxRBEK77NfX4AcDn7hpSPE5fKitbcvm
         MMKEpQJjv8c+aj7uFtLrlFSiIo5A/0Q2OjKp6O4ReXjqxzc2zLuXQTid+bwC7Eb/bxdL
         6yTA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ1+c0hiQjrZIs8ISqAFVeSD7WcAdMCyKpTr3uwC6sfuPOKY4O6OUwagldW5HyjP2//fOOvjD7wWldlg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwOvmuS8Rp2C3xuNoFlqn+i0ScBd5I1f7vdardvY9D8n2zVS8fR
	ykUzwwHYuqM0mi9k2N6FvCE1td2DyMPuo2ZrRCxRTsWe4UO0D9WHS8Ao3dxtFd5R/igfsmxwgYG
	P/qo3sf17lUR5NnBE2b7ca4mzEYM=
X-Gm-Gg: ASbGnctBAp8pwM20+amrQMxqWThBaz0528nM6O154HHhgF3d28SdNgi7nc9Yz+nDBHl
	7Gn0LGTM8tLzW6TFieoMZkWaD8G8wLfIQX2uH3eJvcaRTF2cPFEIEodiUux2Yf5nantMNprLHFk
	DwB0oySE1MNryqHx3YxEuG3C+LGB7WMbd41c4Ff7VI
X-Google-Smtp-Source: AGHT+IGiRNUzPFdPSLLv3HybeyLyN8HPd/5lzM/oyvuyIgllHW/BtQW9F5MZSBv3hVR+Ngp7/Cv5R4OpJ+MTpbZUlWw=
X-Received: by 2002:a17:907:9707:b0:ac3:8626:607 with SMTP id
 a640c23a62f3a-ac782e3a8camr647737166b.38.1743601011777; Wed, 02 Apr 2025
 06:36:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ed09edb167e74167a694f4854102a3de6d2f1433.camel@irl.hu> <8963a409dd575e040e5f07e4ad5e9c1d26b421f2.camel@irl.hu>
In-Reply-To: <8963a409dd575e040e5f07e4ad5e9c1d26b421f2.camel@irl.hu>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Wed, 2 Apr 2025 16:36:40 +0300
X-Gm-Features: AQ5f1JquQhOZxQMjaSHZ3hNl0wenZmYuULWVR-_sE5d_ZmjrXEhKjyvAnCxSmPs
Message-ID: <CALT56yPd-xfd=47xRxrCk4F3jib4Ti7kg8pRXy-gVAQpbOc=pw@mail.gmail.com>
Subject: Re: amdgpu_dm_connector_mode_valid regression
To: Gergo Koteles <soyer@irl.hu>
Cc: Dmitry Baryshkov <lumag@kernel.org>, regressions@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	Alex Hung <alex.hung@amd.com>, Harry Wentland <harry.wentland@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Apr 2025 at 15:00, Gergo Koteles <soyer@irl.hu> wrote:
>
> to: Dmitry's new address
> cc: regressions
>
> On Wed, 2025-04-02 at 12:40 +0200, Gergo Koteles wrote:
> > Hi,
> >
> > While playing with
> > https://lore.kernel.org/all/61c3df83ab73aba0bc7a941a443cd7faf4cf7fb0.1743195250.git.soyer@irl.hu/
> >
> > I found a regression that prevented some EDID DTDs from being selected
> > in some specific cases.
> >
> > This is the first bad commit:
> > b255ce4 ("drm/amdgpu: don't change mode in
> > amdgpu_dm_connector_mode_valid()")
> >
> > I think the problem is that decide_crtc_timing_for_drm_display_mode()
> > function tries to copy the crtc information from the preferred mode,
> > but that's not filled yet if the first one is the preferred one and
> > it's not the one with the maximum refresh rate.
> >
> > amdgpu_dm_connector_mode_valid()
> > create_validate_stream_for_sink()
> > create_stream_for_sink()
> > decide_crtc_timing_for_drm_display_mode(&mode, preferred_mode, scale)
> >
> > It works if I call
> > drm_mode_set_crtcinfo((struct drm_display_mode *)mode, 0) before
> > create_validate_stream_for_sink()
> > in amdgpu_dm_connector_mode_valid()
> >
> > or
> >
> > if I comment out the decide_crtc_timing_for_drm_display_mode() in
> > create_stream_for_sink()
> >
> > but a better fix than these can be imagined :)

Would it help if you force recalculate_timings to be true if
(drm_mode->crtc_clock == 0)

> >
> > more information:
> > https://gitlab.freedesktop.org/drm/amd/-/issues/4085
> >
> > Regards,
> > Gergo
> >
>


-- 
With best wishes
Dmitry
