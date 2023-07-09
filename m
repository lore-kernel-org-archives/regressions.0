Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715232CA6
	for <regressions@lists.linux.dev>; Sun,  9 Jul 2023 00:00:53 +0000 (UTC)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-791b8525b59so1126169241.1
        for <regressions@lists.linux.dev>; Sat, 08 Jul 2023 17:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688860852; x=1691452852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gCTYOFpZ33F5UhgemDclft92cknyKeyRtlgFADnqHWw=;
        b=FGjGp/5lxuVEZkuZWmh5w2IVh5U1D+j17NreINRb8RWNJl0qmLm3RKcIy/p0KdxZUQ
         zVeS6ihFXJPSYvG/5lcBr40wbBr+wUHx4ZgFizrxHCd3yV6KbnRutUErmq56ph/sYMXn
         6YwZclgJLVsJXSKiTNlloO/fvNIXpFK4I5iRgeyNBHxMIpj6BJdPQGYPMDISR85huQjt
         PQyQ4A8yWT01bFRrizqNVW5zg0FErnPp82vzEbE7L43ugKjLRzTgvdx+c9VfNWu/bWjy
         r8qh9KsPnznq5i4sayiN9nOy90Xlm887qdZ3CafcFwmuMfIr1rj9pTvfqRgWzXSYEnSH
         D1YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688860852; x=1691452852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gCTYOFpZ33F5UhgemDclft92cknyKeyRtlgFADnqHWw=;
        b=AH/27itWIJxkte5nT4mPD96QhQh6PZdF2qx5qYLZVYu3Kn6dhfupF3bzEBwTk6GbIE
         5MwjKhzWsdApIQr0KtEHVDMm6MLKqZNmHrikQlPmP9r7QplFF8ndOzOZ4jWrntYIM9cX
         qEVEcPJpwrh6/FeVx9+ruNvzX5bzEOKANr5Gwe+1ygrlk/Z4v/AijgUxB8nhvxAeAiHI
         C49adxHq/8iEzjr+/Clj6H9+SOCMHG7jHrJ293c3UfOV0o6PP8QMNQHyG7FVpLSu6v0U
         08A/+4/4HWJnbInoRwxex8LvJNMf8up5g0meo13sOhSDv7OnmOK4d/NfdDOAGksKajFX
         lDTQ==
X-Gm-Message-State: ABy/qLZ3e8gz6PdgmbK1W8jBzx2etKvzMStTR0+ltRQ1AOOJGpHUJIEY
	PSyUGOn61Jl6PVG6VHcgQLDDUxByVsLUpCpEkRc=
X-Google-Smtp-Source: APBJJlHDtm11y7Gufvz4Gqec/NdH2pk7IDgpiKTKFnJaCaJR+CTIONi0xDNiCGcBLGGDfcIbBTwGJCuNj3yHuFr+fdg=
X-Received: by 2002:a1f:d486:0:b0:453:b080:632d with SMTP id
 l128-20020a1fd486000000b00453b080632dmr6263863vkg.0.1688860851887; Sat, 08
 Jul 2023 17:00:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230429020951.082353595@lindbergh.monkeyblade.net>
 <CAAJw_ZueYAHQtM++4259TXcxQ_btcRQKiX93u85WEs2b2p19wA@mail.gmail.com>
 <ZE0kndhsXNBIb1g7@debian.me> <b9ab37d2-42bf-cc31-a2c0-a9b604e95530@gmail.com>
 <CAAJw_Zug6VCS5ZqTWaFSr9sd85k=tyPm9DEE+mV=AKoECZM+sQ@mail.gmail.com>
 <7fee3284-b9ba-58f4-8118-fe0b99ae6bf7@leemhuis.info> <CAAJw_Zu=MPtGPARgCB2fteP+7F793YDFXE9RuzSH8EqYBS-OOw@mail.gmail.com>
 <64b8732f-6319-9f10-b82a-b4a3dd8d4b8e@lwfinger.net> <CAAJw_ZvZNQzrFyQizJnKe5PerqqAUOmPYd6cnjAcvs68xNdwSA@mail.gmail.com>
 <ff646259-8ce1-f1fe-4627-cdf99321dba8@leemhuis.info> <0068af47-e475-7e8d-e476-c374e90dff5f@lwfinger.net>
In-Reply-To: <0068af47-e475-7e8d-e476-c374e90dff5f@lwfinger.net>
From: Jeff Chua <jeff.chua.linux@gmail.com>
Date: Sun, 9 Jul 2023 08:00:40 +0800
Message-ID: <CAAJw_ZvBUpMMC886CDdsLFW6bUG69X78zVfre7gCfu=aTR1xGQ@mail.gmail.com>
Subject: Re: Linux-6.5 iwlwifi crash
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, lkml <linux-kernel@vger.kernel.org>, 
	Gregory Greenman <gregory.greenman@intel.com>, Kalle Valo <kvalo@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Linux Wireless <linux-wireless@vger.kernel.org>, Linux Networking <netdev@vger.kernel.org>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Johannes Berg <johannes.berg@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 8, 2023 at 2:07=E2=80=AFAM Larry Finger <Larry.Finger@lwfinger.=
net> wrote:
> I am certainly no expert on iwlwifi, but this change looks suspicious:
>
> @@ -10,8 +10,7 @@
>   #include "fw/api/txq.h"
>
>   /* Highest firmware API version supported */
> -#define IWL_22000_UCODE_API_MAX        81
> -#define IWL_22500_UCODE_API_MAX        77
> +#define IWL_22000_UCODE_API_MAX        77
>
>   /* Lowest firmware API version supported */
>
> The parameter that was originally set to 81 is now set to 77.
>
> Please try the attached patch.
>
> Larry

Larry, tried, but that didn't help.

Thanks,
Jeff.
