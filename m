Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C357E8
	for <regressions@lists.linux.dev>; Sat, 11 Mar 2023 14:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678545096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=INJDANEQXKU0xsqosQ//yXFvq7T3jrX3e/2hzObW3f0=;
	b=XOVGsMnvezoLqvqxkRDsBONDeLzrTf+cy0U/kGtSnwDlDkqnKMl1kKdtDnHeiZPssEqJw1
	+j/FS4jqIZPPmo3tsdAkrghYETuzeHMZk9OuOGSkjYxDgR3Lq1st/U43pqxz29oZOgRjba
	u2ArjjFkHCoQ3wAwXTOYejHz9+zAFu0=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-S1yCVwcNMuq2p4IoZ4jlLg-1; Sat, 11 Mar 2023 09:31:34 -0500
X-MC-Unique: S1yCVwcNMuq2p4IoZ4jlLg-1
Received: by mail-ua1-f70.google.com with SMTP id l31-20020ab03d9f000000b0073fb003de27so1133482uac.23
        for <regressions@lists.linux.dev>; Sat, 11 Mar 2023 06:31:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678545093;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=INJDANEQXKU0xsqosQ//yXFvq7T3jrX3e/2hzObW3f0=;
        b=1VgW/srWV5h8XM0qCw71gA+G0g8j9bQtKa6dCpsH7Z1GK1hkoi+dIzphc46qFHMBvb
         qvByyiQktjBsa7RLDUoYoTCQorByQSSb5rjYpyMFc5Vs+Pvnb3+FEhvwmKcXUwV4fCOA
         EoDFPVCEJ+OB3XMlJfSO2N/Wea/UK6j6dbbMdwemAkcmOJklGB0kjL2iRLCNkzTvpD2c
         ZHHyZz+AIWZoBaZEifrf0sgyQ9Y6IqBu/Sp/P044iiJezQBEDifVOq9J3Ks6dA3Hv36s
         PjUagD+Xth3tbBtw0IwbCqpWyfJWIEdG8XCROE0iur8xRpZ2m5bmidUtPIUdk2JcWq1h
         pHYw==
X-Gm-Message-State: AO0yUKW/ZnddJK7TdWd1pJUmcKVmIgQGph2W4NEiTVAoU3ygz8st8Zvk
	46KOOZNTY9Nxo6KIBd7jwnTg99rZ8xNxaWAslyPy0mJ8vCxlOLZkmbOuUW0xP3dbzoLEHygvT1F
	2hczencdRJxSg/EgoIQgXPJyRUkITAhdjDJ+MGsQ=
X-Received: by 2002:a1f:4358:0:b0:429:73a8:6dba with SMTP id q85-20020a1f4358000000b0042973a86dbamr12974020vka.0.1678545093456;
        Sat, 11 Mar 2023 06:31:33 -0800 (PST)
X-Google-Smtp-Source: AK7set8zoROtzVyy3knl/9H3DfJsJJvBDGmhfiN880HUo8QG4OZ5lUIyateA8pR1NXbwisLQVNcIStUvBVgL1TdBOy0=
X-Received: by 2002:a1f:4358:0:b0:429:73a8:6dba with SMTP id
 q85-20020a1f4358000000b0042973a86dbamr12974004vka.0.1678545093176; Sat, 11
 Mar 2023 06:31:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <d6851c2b-7966-6cb4-a51c-7268c60e0a86@marcan.st> <20230311141914.24444-1-marcan@marcan.st>
In-Reply-To: <20230311141914.24444-1-marcan@marcan.st>
From: Eric Curtin <ecurtin@redhat.com>
Date: Sat, 11 Mar 2023 14:31:17 +0000
Message-ID: <CAOgh=Fw7ULhH0PrANYHwqz504SMfNfooUBBjaU03e8L2uhuzPg@mail.gmail.com>
Subject: Re: [PATCH] wifi: cfg80211: Partial revert "wifi: cfg80211: Fix use
 after free for wext"
To: Hector Martin <marcan@marcan.st>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johannes Berg <johannes.berg@intel.com>, 
	Johannes Berg <johannes@sipsolutions.net>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Alexander Wetzel <alexander@wetzel-home.de>, Ilya <me@0upti.me>, Janne Grunau <j@jannau.net>, 
	Hans de Goede <hdegoede@redhat.com>, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	regressions@lists.linux.dev, asahi@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 11 Mar 2023 at 14:28, Hector Martin <marcan@marcan.st> wrote:
>
> This reverts part of commit 015b8cc5e7c4 ("wifi: cfg80211: Fix use after
> free for wext")
>
> This commit broke WPA offload by unconditionally clearing the crypto
> modes for non-WEP connections. Drop that part of the patch.
>
> Fixes: 015b8cc5e7c4 ("wifi: cfg80211: Fix use after free for wext")
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/linux-wireless/ZAx0TWRBlGfv7pNl@kroah.com/T/#m11e6e0915ab8fa19ce8bc9695ab288c0fe018edf
> Signed-off-by: Hector Martin <marcan@marcan.st>

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

Is mise le meas/Regards,

Eric Curtin

> ---
>  net/wireless/sme.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/net/wireless/sme.c b/net/wireless/sme.c
> index 28ce13840a88..7bdeb8eea92d 100644
> --- a/net/wireless/sme.c
> +++ b/net/wireless/sme.c
> @@ -1500,8 +1500,6 @@ int cfg80211_connect(struct cfg80211_registered_device *rdev,
>                 connect->key = NULL;
>                 connect->key_len = 0;
>                 connect->key_idx = 0;
> -               connect->crypto.cipher_group = 0;
> -               connect->crypto.n_ciphers_pairwise = 0;
>         }
>
>         wdev->connect_keys = connkeys;
> --
> 2.35.1
>
>

