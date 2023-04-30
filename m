Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357E523AE
	for <regressions@lists.linux.dev>; Sun, 30 Apr 2023 23:57:54 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-42febf67609so561957137.2
        for <regressions@lists.linux.dev>; Sun, 30 Apr 2023 16:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682899073; x=1685491073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5yOMPitISYAlbpaB11MkGcUAwlL+JYlE7n3Iz8ufFk=;
        b=f1AaNZHBnAEJzKBd0h6IkFWqk9amZi25t38VA17+VcbfH0J97hr4b1RVLBZGgGlPjq
         0Y1/N3juwlzIclF748EhRHOG1BhWVwgxNm8OMGAj2FzxdKwfbLf2qCUkb33XWDBnq70l
         Mn1lPoULdMUDgQUAxHlpKUnHwWMxkTaS/AHL/Mp34FQaEmCUEzSeYL6FGUH8ZUBGybvm
         SwtHBelp1iO3TCETcTDwLCm7tnBV1gmKudx3b7Ycel2XXSbx2sI5H+T3rc7npn0lvREq
         rAwNuHrYLGr21AHWTirKstqsn/j6mdxdW+/3n7FQy/nnbhejIRRWw1mmgjI11UUfkuqN
         d1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682899073; x=1685491073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y5yOMPitISYAlbpaB11MkGcUAwlL+JYlE7n3Iz8ufFk=;
        b=BoL/m/DxytGyyjb9mD1HswCNf40x6kUJEtucc0pi1TKHNt8RYRYpRyjRZlaPEUDWTZ
         4yzRYLNELYByzRdujm/Oafp8/yRUi6d6/mPTPZ/hHPmbHnk9Qa5kYt6Zs6knqXxMVTQb
         /OBYUB8RuqXh8rSsHi3iY0QSKa9NFPNsUsc0cJ+oH0nQmZ5aGELude66JxmQAgQRF8Cx
         5ykFLsBlYpN1HqRcRprr4nG+4zykG3gSPh2K9/YkZIGdCo+s4e/ojQTaNzlkdppu7Nf1
         y/nntqBdcSjo6PQLxKU4YboEVqVO7dLc9pijJdwBl/g4w2fCzHB4dEpYngpTA6nD04a9
         9iig==
X-Gm-Message-State: AC+VfDyCRhUrsTVTBqNPukzyIIaTMXv6Mu/V9Ken0jg2jH+iTB5ViW+X
	koM77BmLlX+cR6PzonNGxrDji8fypGjBpHiSM6k=
X-Google-Smtp-Source: ACHHUZ5CsWQV7H563NgOgOzxqRbohUZKUSDeVX7Jo4SjdJwXY1g6eQIHAUoxDtw7DESK/5724qipuhp9akOGPe6jhMs=
X-Received: by 2002:a67:edd1:0:b0:42e:6298:801d with SMTP id
 e17-20020a67edd1000000b0042e6298801dmr4655196vsp.20.1682899072981; Sun, 30
 Apr 2023 16:57:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230429020951.082353595@lindbergh.monkeyblade.net>
 <CAAJw_ZueYAHQtM++4259TXcxQ_btcRQKiX93u85WEs2b2p19wA@mail.gmail.com>
 <ZE0kndhsXNBIb1g7@debian.me> <CAAJw_Zvxtf-Ny2iymoZdBGF577aeNomWP7u7-5rWyn6A7rzKRg@mail.gmail.com>
 <CAAJw_ZvZdFpw9W2Hisc9c2BAFbYAnQuaFFaFG6N7qPUP2fOL_w@mail.gmail.com>
 <e9c289bea2c36c496c3425b7dc42c6324d2a43e3.camel@intel.com> <0785e432f1776b3531e8e033cb5b48eeb58b12b6.camel@intel.com>
In-Reply-To: <0785e432f1776b3531e8e033cb5b48eeb58b12b6.camel@intel.com>
From: Jeff Chua <jeff.chua.linux@gmail.com>
Date: Mon, 1 May 2023 07:57:42 +0800
Message-ID: <CAAJw_Zvafhng8oP8E6HyhB5DK-WSQm2_yNbbHhgbTQb74pM-fA@mail.gmail.com>
Subject: Re: iwlwifi broken in post-linux-6.3.0 after April 26
To: "Greenman, Gregory" <gregory.greenman@intel.com>
Cc: "bagasdotme@gmail.com" <bagasdotme@gmail.com>, "davem@davemloft.net" <davem@davemloft.net>, 
	"Berg, Johannes" <johannes.berg@intel.com>, "kvalo@kernel.org" <kvalo@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kuba@kernel.org" <kuba@kernel.org>, 
	"edumazet@google.com" <edumazet@google.com>, "pabeni@redhat.com" <pabeni@redhat.com>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 1, 2023 at 2:00=E2=80=AFAM Greenman, Gregory
<gregory.greenman@intel.com> wrote:

> > Strangely, I couldn't reproduce it on my system. But, anyway this featu=
re
> > better be disabled for a while. I'll send a patch with a fix shortly.
> May I ask you to try this fix in [1] (also cc-ed you on the patch itself)=
?
>
> [1] https://lore.kernel.org/linux-wireless/20230430201830.2f8f88fe49f6.I2=
f0076ef1d1cbe5d10010549c875b7038ec4c365@changeid/

Hi Greg,

Applied the patch. It worked! Thank you!

Jeff
