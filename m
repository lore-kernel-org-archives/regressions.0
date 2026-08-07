Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454243FCB2F
	for <regressions@lists.linux.dev>; Fri,  7 Aug 2026 12:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786105606; cv=pass; b=qNNsb+3dRbezqTZxUi1gfMRcSzXx0FH58ovuGY9FqYsmJIxJp09BgxnVY4vAvqlZgKFXL2Uj1FhzS7SYbVktBk+pveNMLd5TvtPo0dfnsmsRlZDPvoV3O6MWppp4Oy06CJEjfSdLJokLAcX1OPivcqBIPJRulmcTVT/sMixWSno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786105606; c=relaxed/simple;
	bh=6234D8LBfUC42DK7gXm/LmHnQDFcKbOyodSX133frx4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CsyE2/qkVMUJJrlxQkZkScsMRTD8GOfa3JdlYBv3nLlqL7D/U8KqEO0wAXwY+adAxNd2QM9d86WkInh9qSFw4Q8d7E/3/FHD/O0hLjZ00y2ferDRr2tLFt95GGRGszPkYHNt0DZPMhAo/U7m9Tb07DdtBn2ucISpKh52wNz8Xb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4nxohxg; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4nxohxg"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6688a2dceb8so2149570d50.3
        for <regressions@lists.linux.dev>; Fri, 07 Aug 2026 05:26:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786105592; cv=none;
        d=google.com; s=arc-20260327;
        b=BdizRlcw0PHEKPGV9cYBVT83apkYwZvhxWYXrE5qFwMEwRCR5z0keIncYFVWbp5+rt
         Lcj/IKOi5jCi6wrabdNmcpSdav3bdTNWsqndrLSrEDDSbhyotcsRtNwT1+iQ+Uv+eF9N
         MUHwcWYIoZkjY31mrVmBJn2FXCMNmcf/W3usiPl61+bLEqg/zj2PbGGMhFsB9ENGDOrz
         RnVN1xRLJCVobxY6/FpyYQZVY2xEayhnZFvm1MzQ++vzjRbUsAZXxrcGJjol0QKstfAM
         IN5NumIMMRdFAoa7b6xImovf3nkgfd5305VrvZKOhiRHT2yrHpJciwImbJfg4EVR+I9K
         AKUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6234D8LBfUC42DK7gXm/LmHnQDFcKbOyodSX133frx4=;
        fh=DUVZop+Ly59RvqALr8CU/DLsWpvrYqNFmo/2jqHhPUI=;
        b=gZ8Rk4XOm/EKrgU/64mYvnpQ0pF8WndeMZcTX63hrlgkLuCD4Ad8AEaA50X3Tx2wkg
         c9XlphzOhLmJH6fu6D6AUThShF7v1W7/aTrlK9xx4r40hp4QHKXfKWS9KqBr64LIEv+1
         /tM+bFuobUV7bABOCIWATmqcDNPmiCJgpMkAPbyf7grj89tK6DfjIKvxRZH7d3aDZg4a
         Jq+E5XXJJTK+fKJhN74I8m5BEaakDO8dVK9J589vRES6HPbNbExsZCiRT86HphG994T4
         vEECh/ytFYsgdaXvl5zsdp2Cun4yqSGpEcjPuPka1msiM6ZwCBmgoS1GZjz1k1xd0aC4
         GYog==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786105592; x=1786710392; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6234D8LBfUC42DK7gXm/LmHnQDFcKbOyodSX133frx4=;
        b=V4nxohxgtYkA7nhZDydknMYfLYtfLbN8EXBjwDXx4tB3bwdvCAOKB0vy+EgR/GHmmn
         A2iTtJAwYySpdrLBIB/NMtaBCyTB1W0AAwvRqxb99oy9hBZtGchfWmUXEZIIfyJU62UF
         7S6XwDzKUuYWc++3ClVdZVQOhW/tIKBl5UXfvIJi4gGQQ3i7JdUJOXYxVfBtM64NIMRd
         zgYyefAZhHWjhXBADtN78RDdkHMfUROpFA1dvxvKGbqt/bncHmcpt4rLz1ED3yPc1ajw
         9U5UvLIqm25BsfL1ucSk8F4Z0K3mxfF77vQlGnMoXS5zwOVgqSzqzu+n/yNeGqiuLlYm
         TY0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786105592; x=1786710392;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6234D8LBfUC42DK7gXm/LmHnQDFcKbOyodSX133frx4=;
        b=Yjn7inQE/yU8g8ib159N79D65qhS5uzV3gy3F4Ukx5TphLy53vH86dajOXwZbKtxCw
         OiSQZf38mdtTQaLEdwpYp4vZbgb21vmf3t4g0Bs2HitffKVqhQ+PIUQRlxTjLeWTLxXY
         fcpgoXn0jiXscRSbMi55pVL5A92MXcEME8TA/e3YU/oZI7hBPhWu0fsq3/mdQh/sTpYY
         XAoA9yz7YYCDZYGWIgiJhGYHZ5S2ytPMj15cJSQVa3vixSa54ktVElP01NY/NYkA071o
         5eIoetnlg5TbaVVcRH6f3AY+SoYVwBCstmJ0Z9CCC5BeTzxFh0f58bV5HgRrD7wtpoD+
         Pzjw==
X-Gm-Message-State: AOJu0YzYURGfRJ3ocO+FO2eS4x3c97OPCOEGgRN0wKGnCF1pxbIieMVV
	hJJ/TeRYX7ixndP9pBNz7lkbCxDMVbj4vFxGPXUwZWktf9ONTxFIm6xkk/oVO3lfgvYDBq81ygC
	cC4XB7jzk/RdKFwUryjKe44mC88i0SElgtULVIZU=
X-Gm-Gg: AR+sD13GzY7n4IM0Bhb54rZCyZIUxRpmauIQOnjJrbITJzsaAC2DXGRjLFiWv7tjFer
	ne8Symu0RPkyiqJhA7gspy+hXcS2qCMbCneCkx77K/ASTjZWZUpyYNjYodaZ9pX/V0zHj2aFDwV
	9TiSZPW7XuAQ4YreI9V2LCaxFQOy1+sgHiPIqnc6qouGyfvK9tj2iXIcu/Dezp+5plGWVlB8nSN
	5hfrBlr9owYLf9ZajggjYNxuykz6qAjmXNVAyeQkAtFyL8kvsndewvecZV2r/rizmlUsi5zOee+
	H01E0EzN3mo9gOuPW2fmooELY4XdlfiGyv7D+SdZIMGC81TIBavwPcj0SVfuqQHUb3zWSp7gUuW
	twvF8/EW+0XQ=
X-Received: by 2002:a05:690e:480d:b0:668:90cd:8aef with SMTP id
 956f58d0204a3-66acd2f1bf7mr1336478d50.25.1786105591669; Fri, 07 Aug 2026
 05:26:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJOGg3z6LJPDsdPNBxajgy8_wQxfhYBRxe4EiurZf3kPU5A5Bw@mail.gmail.com>
 <f42cc94c-ff60-4999-b473-c2fc5b1b4199@intel.com> <CAJZ5v0j1Tucb0yzS8=3U_X1E4ziztjgOsiYrc_QfUUKZfScCPA@mail.gmail.com>
 <CAJOGg3zhEFner5pze-eX+6jh5D8nJppyWkNN5bWtg7MZ7cW9_Q@mail.gmail.com>
 <CAJZ5v0ib2YxyX-6j34=w+FEOH+fsGF_ShH9Q0YCEDkZvRP88EA@mail.gmail.com>
 <CAJZ5v0gySOkYRphXHbXcStFGiuMtni_OWXW2rTDoa_V2PRPnJw@mail.gmail.com> <CAJZ5v0i_AS1JzyM10yPfM5QsNVsQmQ3=haHCcTiM72FZm+G+Qg@mail.gmail.com>
In-Reply-To: <CAJZ5v0i_AS1JzyM10yPfM5QsNVsQmQ3=haHCcTiM72FZm+G+Qg@mail.gmail.com>
From: Julien <julien82453@gmail.com>
Date: Fri, 7 Aug 2026 14:26:20 +0200
X-Gm-Features: AUfX_mx9S7wOi18myqNhYzBSITOrslEjXCrKmoDPgcg1jNxB3zXGDhsWm_H5WQo
Message-ID: <CAJOGg3wZvftfk-hZ_wXBYnXca9gf5ziSo0Uh1BouYvzoEyEVrg@mail.gmail.com>
Subject: Re: [REGRESSION] no TPM device after "tpm_crb: Convert ACPI driver to
 a platform one"
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: regressions@lists.linux.dev, jarkko@kernel.org, 
	linux-integrity@vger.kernel.org, 
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 12:45=E2=80=AFPM Rafael J. Wysocki (Intel)
<rafael@kernel.org> wrote:
> And there is a v3 already:
>
> https://lore.kernel.org/linux-acpi/12955541.O9o76ZdvQC@rafael.j.wysocki/
>
> so please test this one if possible.
>
> Thanks!

Yes it still works.

The logs:
MSFT0101:00: [mem 0xfed40000-0xfed4103f] expanded to avoid overlap
tpm_crb_acpi MSFT0101:00: [Firmware Bug]: Bad ACPI memory layout
