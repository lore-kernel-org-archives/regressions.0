Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D0635949
	for <regressions@lists.linux.dev>; Sat, 31 May 2025 21:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748726709; cv=none; b=CdeFwTZ3HHJ1gNZ+4Nm0ZSVnrofkAARfljPKukTj4rLMiJWeqzpMpy4nQKp+hQhAsIxTIOpkt8effDAL+MOSmYzFNK08bwUnK++jUzOvRi7x7OO57G5bRDPqjs9hFY69dXaCx4Bj0rMcRmGIZDqo4Yuo++MhIiuEXMA2kfobv9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748726709; c=relaxed/simple;
	bh=VY9Ha0+7+JTRQMdymnY6ha9JZSlyzf1a6oMqIm5U/sI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bwFrds+prL7KM979y/R549finMui4CyOLzV07cNNI0p2d/NvaUIxMtiufjBWbHK9/jlUciFbHk1S1PpMA0Yyf7us9dB+/hsRP/JrVxBGiiYBK1eMybrYAP9jmkqSHGGSZ1Bcc56oq0ahGnnPfdhMrG7EHfIpKSQp0nrvIVR2pJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PzkpguCP; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PzkpguCP"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-70e2b601a6bso30477147b3.0
        for <regressions@lists.linux.dev>; Sat, 31 May 2025 14:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748726706; x=1749331506; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VY9Ha0+7+JTRQMdymnY6ha9JZSlyzf1a6oMqIm5U/sI=;
        b=PzkpguCPQ6o0fzCDUiIe2zrXbaqWB17sIE7eoYuctOdBwFFd3gOu/fRmIERpRvfO6o
         C73MqFKkMhod7bO0/iHxxTM2/Ef//H7ozB++wstlfXhKhojxRxsqlp/eF4R8y8ItpSC6
         H+IhhYxz6+MhyTvWwNcQNs6LZDIKs4S+KFmvnaSHAOse8ZsFrDlskTX2I7Iam1Do9MTn
         8GgGgQV2tcg6MgDcfuua58ynTF2d3FpDAWe9WqZobPX4mjA5fiJo26mBAmQllk0WhUxB
         NrM5Os6/KYoQ75RlX2bbGeSZiTNF0nlNs9sWXyjHG9enMrzY1DgM0l5BpkIuKHh9zsXY
         kuRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748726706; x=1749331506;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VY9Ha0+7+JTRQMdymnY6ha9JZSlyzf1a6oMqIm5U/sI=;
        b=J4Ba07xyy9Kq3drF7z9bCNSXsr1KKKmSCLSUKZjCC8XCojTTORFCIqGAOMKE9fQYIh
         xrwfH9Aj5yHsP14nwab6pWhqj4VeanmykoSNYBrEvsVyxu/19KdfuR8RQey82NPsDS5f
         c2q6LsIZiZ2x6MgK9ZXLMksIvG2eYCu6Ig2kYiRvYmWyW39b5OEIu9C3ZaWWcNWhct+n
         O0r3aLj7hpw/ZsyG9dtCjeKb7QY3ozGBHHzLgAc5dwjnwOKPTnOPNzVV314Ds8lGpcTY
         D2USx24Wzs5iuTGgrmDrsIQ1qNRXRLIFP2nl8lckbt2tJVhXhFZYTIYuvMtb4FwZvu5D
         732w==
X-Forwarded-Encrypted: i=1; AJvYcCWjX9fQkwg9pPyf1Evcd6YMtYPyOaIdLPDRy4UZjbQ/7t99b9f1vhqt7ztm/V91j+XQie0VmpPvweijRA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxRRB3+8CCCLqx+/7bin82ITBXFGRnEoSgAfVZdKmhCjKOtcM/B
	uWrfgAviv8m+zckRpqO5wFE3R8iYv1mHpfoW58IBb/iResDIkDh2ByZD59FqJqGmfX6Mu75l+LC
	w9LxsGBvINeAxeG409B+HLbuMy269TEI=
X-Gm-Gg: ASbGncvqhWaZNYIII5jzGQPC2PCgcRnEatZOXkNexSXsfOqGGSrpQ76qBj5RvEuRJ2R
	Fy0d3/7/x4VkNq8FVqFe2kn8SRtbiahutEa/KiObOKJIdBRyMsc0NdYISvLgMr6PzrzVUD4JOGW
	SAtny9QUP+38tL/SDToXuacGKkVaOwnpA2VhX1pMRqBB8pW3j1blHHiDPYFs++DtmnUA==
X-Google-Smtp-Source: AGHT+IFQkd2vXiTlcffydL7iovYgUbxoSpUzUlzihPy5Nly/Dtgdjhm9TQhTBH6LaDjwNpif4wVN3VPFnqH0TVMrmmk=
X-Received: by 2002:a05:690c:4b06:b0:70e:2d30:43eb with SMTP id
 00721157ae682-70f97e78453mr124814537b3.12.1748726706702; Sat, 31 May 2025
 14:25:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAP-bSRbMbZe9LCE15SCbYNTGZjE_xiAm29qzO_WNVjHsJ6oyyg@mail.gmail.com>
 <9ada34661b93fa5dfe3b0c66816a62c1a27f22a3.camel@intel.com>
 <CAP-bSRZm4CyxY1VdtWvZRcfLMwc3njd3OTSd446Q5dcSfjJY=Q@mail.gmail.com>
 <CAP-bSRbon4O=DCLHvOZHm452Svc3-gsZ133Jn7-TFt8f_Y1CFA@mail.gmail.com>
 <36b0f88ff0f17e0246037d5f834ac545afa69cf0.camel@intel.com>
 <CAP-bSRb_f1A=_+A9x8J75socYsKFKDtysZ-m0+6Ks7NdSjQ0-Q@mail.gmail.com>
 <b2674ab2706c2ed81734f2c3d6261511414186bc.camel@intel.com>
 <Z-SdYIm_lDvmCcO-@debian.local> <2a8fe208aaae404a724dcd9844afc2182c1ebf45.camel@intel.com>
 <43c0e4554151e015c068b79b5da7231f8674a474.camel@intel.com>
 <CAP-bSRb+qO-FhtjrGThCy2OoXU-jb3rkzzyUUkk4vP_P-u53Cg@mail.gmail.com> <d3f5b6aea39528ab7647e69f66fa90b26623a543.camel@intel.com>
In-Reply-To: <d3f5b6aea39528ab7647e69f66fa90b26623a543.camel@intel.com>
From: Chris Bainbridge <chris.bainbridge@gmail.com>
Date: Sat, 31 May 2025 22:24:55 +0100
X-Gm-Features: AX0GCFtFRUpgONotrTQETqJcMgIBg9SSQMBQI3FUMyXWkPMQ0C1mzO5RYpOLIuQ
Message-ID: <CAP-bSRb_PeuFMqOjJu=akYsYANQ2ek8N1oR=8RiPXBeefM5_NA@mail.gmail.com>
Subject: Re: [REGRESSION] iwlwifi resume error, bisected
To: "Grumbach, Emmanuel" <emmanuel.grumbach@intel.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kvalo@kernel.org" <kvalo@kernel.org>, 
	"Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>, 
	"Berg, Johannes" <johannes.berg@intel.com>, 
	"benjamin@sipsolutions.net" <benjamin@sipsolutions.net>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Mar 2025 at 04:24, Grumbach, Emmanuel
<emmanuel.grumbach@intel.com> wrote:
>
> In any case, the patch will be reviewed internally and follow its way
> upstream following the regular process.

Hi, did this patch ever get merged? I was just testing another issue and
noticed that iwlwifi still dumps this error on resume in the latest 6.15
mainline git on this particular laptop.
