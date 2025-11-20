Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6637D3570A5
	for <regressions@lists.linux.dev>; Thu, 20 Nov 2025 16:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763654758; cv=none; b=osYuZtv8JygTyJGHzvHDuNh6zy2msTtqAts0nEZbLbXWpileeloNwFGf4Ap7kZQHxBFrhfN2kBs39RZ2xUrxoKZJN3FZhIDavTxTD4NgjW5f3hdiJyzaOYMufoCBJUAvuBNZJBnL/TywWVxCIY+hMaSm5MuivuGZPjYeMHS+jyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763654758; c=relaxed/simple;
	bh=tnTki4cjftc4VCRi/IXO6gk37TMf+BPqLaDLZEPjEX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ol3hWZ2SyixBNH/JJ0RKMlLEIbJcPDx/xQTld6XSK+fM21QUVKigScUupQ/yHq3tHLgVdbuqPU9WGtAksYLZiyW7dNc+bRuIvA8UFpaLeRfSNQILHflXXFX/pYNsWLnDlb0/Yv/45fUuiyjnz89srpcB5jh56JWd4qFsrSNnJX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KYMJQFgt; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KYMJQFgt"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b725ead5800so139506566b.1
        for <regressions@lists.linux.dev>; Thu, 20 Nov 2025 08:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763654754; x=1764259554; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fY5BvWFohYUsQWWAbdgvSo56iCSLE2VcTftjflKg6QE=;
        b=KYMJQFgtQkFmcTjkz18qCA/q23xa2SuNj9Hbkdf9zQs0+4QOHCbFC2guSTSfuqJDi4
         XsqDEs3oP6EPBQo1pCzhk07YxEivDQp6ql3zDWNlK/rl9PTvcJBkWT//7WVs+LdrWqbh
         +NYJ5QXpYoG3mSoJH1KHSmqVB0z/a+kk/44m4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763654754; x=1764259554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fY5BvWFohYUsQWWAbdgvSo56iCSLE2VcTftjflKg6QE=;
        b=CTR+4ag97mG+unM5IuNRDjJLVOskDsDnrC57VNmOFjLLjLuA11+yx2aGxX/4sEbYe4
         anf8+zdI9wRewm7k2ax/URHqoZKvPfglGjb0Ge4AUDPGYSreuz4/IL68H/UhI1/2irNa
         aACHXiu9vN8tNGQquzquZ3gVITr6rYbXnThU2hG23h5hKkVhcm2yu7mPyHR0YInmluO+
         9KNs08l42RFSg8VTBYxBPz/8eHqepi3XAy3AW2GNFvN16969jmg13a9niEFqg85L8h6o
         102fq/wMx6V6yFwBwBEEuROjnTM9w7nHSpIpUyFSxP1pgJ8OLJpB0DT7UOgH4yZCpPM1
         nOSw==
X-Forwarded-Encrypted: i=1; AJvYcCVE4Nz8C+2nL54rdOr2yeZPC7s4EYsDO4yzjbSeAYhqto+J0L6wfQPBZBI4iDISs/uCeSgbSmxmwucNCw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzEi8v4M28bzpdX+yurFMUScXZ1BUKaJL0PzHKaVFsAtzaiAJLE
	rdR+5junR5u96Et0oSLa95kUKte5pXFoR3e0Jys0NOeG6TICPEKV6/UQOfMt+wo2Ac73tCbW2Ql
	d5QHU3ud7
X-Gm-Gg: ASbGncsNXFsKH9oZSdaQusntfqCTETVq7qeBgqevvlKI079rSAAhC8G6YYq455jugq6
	G1MX7Du4OhhJYVWWvO242/tci/4nNq4gYdAt+DRVrYgHlPAhP96i3nzXKpmSP8VFqoER5MDh4L8
	dEXBV4jSmFyP3eiR8n4rkkTFojd83KmNyuO2eiQUlkQHvdK/hh2N0Q78pKeuEREXUhgegVW9VZ2
	ehJ39XSSkUTqlnxDFHXhZlPXf4RuK/oRmAMNNWDzggWWZjWLKjL1uASOJ4QsZ0GvAdOaZoEDejC
	M+skdKDFfOxD14a3727QRuUJxi7Y4oOwQi+KGTcsNQKZ6F3m7OzGmzT2hOjvMDgMdIbpB0zG9eL
	8wmT4wKAg9d5qZSbhDncHhXwnQtUrFL0e8JXkkBkWwFXpoma/HHosjKJzKCYxXYOKfLv9wtiYH6
	yURJd+uBjI9fsH+LhDu4MV/hNiJ8LbgwkgRWRqR3b0vnqGkBeM/Q==
X-Google-Smtp-Source: AGHT+IESw/Jc7DCoGA1Fr+xvoQm+qPOBs4EaDlt6lF852WVx5lYca4anWMZMHOPBi9fGNWdfW28l/Q==
X-Received: by 2002:a17:906:794a:b0:b73:5131:c45b with SMTP id a640c23a62f3a-b7654d0c796mr343703466b.22.1763654753618;
        Thu, 20 Nov 2025 08:05:53 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654d7a0f4sm241402366b.26.2025.11.20.08.05.51
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 08:05:51 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b72b495aa81so140118266b.2
        for <regressions@lists.linux.dev>; Thu, 20 Nov 2025 08:05:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWE+PRglOJh31mhbUtT+Ns6C0HLt4DdosIFuKYZs/Jjvz7QsSv3ErLKld5fdqEb/01XK5OW2Q4ubd121g==@lists.linux.dev
X-Received: by 2002:a17:906:dc8c:b0:b76:23b0:7d70 with SMTP id
 a640c23a62f3a-b7654ea998amr379971766b.39.1763654751460; Thu, 20 Nov 2025
 08:05:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251119085354.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid>
 <2025112007-quit-enable-3fa1@gregkh>
In-Reply-To: <2025112007-quit-enable-3fa1@gregkh>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 20 Nov 2025 08:05:38 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V7jja=CsA4QyrGNHPKbSb3wfbLbhET+j01cUeuZGSdsQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmHJc4rIzwwFhnOnl9hbzodCqBW9sxgLfvryl54nq-vWqoNlY_oT15PM_w
Message-ID: <CAD=FV=V7jja=CsA4QyrGNHPKbSb3wfbLbhET+j01cUeuZGSdsQ@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btusb: mediatek: Avoid btusb_mtk_claim_iso_intf()
 NULL deref
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, incogcyberpunk@proton.me, 
	johan.hedberg@gmail.com, regressions@lists.linux.dev, sean.wang@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 19, 2025 at 11:12=E2=80=AFPM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> - You have marked a patch with a "Fixes:" tag for a commit that is in an
>   older released kernel, yet you do not have a cc: stable line in the
>   signed-off-by area at all, which means that the patch will not be
>   applied to any older kernel releases.  To properly fix this, please
>   follow the documented rules in the
>   Documentation/process/stable-kernel-rules.rst file for how to resolve
>   this.

Sure. I'll send a v3 with the Cc to stable added and collect
IncogCyberpunk's Tested-by tag that was given in response to v1.

-Doug
