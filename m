Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A8E27708
	for <regressions@lists.linux.dev>; Wed,  2 Nov 2022 21:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667423409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DvBatXmsfgBByl7zudZcT2LmGuU68sy6TvDlpawOQi8=;
	b=QnDl0o8Zx12/zEKwQqyGqC1g2TMOFLjy8vuv8c6z2O/HUQkeBRMekX48ce8c0EomQQ1TMm
	AM1AGy2O9wqQpZWLymAvG6jAnGkuCuSiQ5OipU9XhYatL3rCgfDKaAi0XLIX7+USP2bauB
	smYQEwix0uvJsoS6Ww2L19emNnFFDUE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-178-Gb3puLQqML6HUEp6ffxspQ-1; Wed, 02 Nov 2022 17:10:08 -0400
X-MC-Unique: Gb3puLQqML6HUEp6ffxspQ-1
Received: by mail-ed1-f69.google.com with SMTP id v18-20020a056402349200b004622e273bbbso82888edc.14
        for <regressions@lists.linux.dev>; Wed, 02 Nov 2022 14:10:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DvBatXmsfgBByl7zudZcT2LmGuU68sy6TvDlpawOQi8=;
        b=DRKvpKgLhSYH8zJvPILYTeSU0gejU/rSjjDf2BGhgSUgL9MyEoI5JByklwiwTHOMve
         ZyzjudJOXx2NJ3CknE7+EgD2lTnlb1bJz6SMkbcApY2BxhNMxghh3fPqAtljUvfxUcyU
         AnxTzGj14RtBvx9dqYU61+YuuJ0s5E9nQiiXNiyQmSm+/fKYTGhSD0Z/Xw9MAwotORrw
         U/U3nXi3brWJzdZ52d0B9Qn8xTuCRcq6zY+Bn3DbHblbJ0uRP6k8AJGu3wC3b6jPTMPC
         Qaf/rkR63FYoOVcJ0lmPEamdLDvaqxENRVN7MgwWBpkckisiMirz17+QSrh2jymqaPd9
         4img==
X-Gm-Message-State: ACrzQf2k8/qQT6hKfrmHnReDbqJmIbr5c9HBTgGZzTihBJjwYWjTWCA5
	fzYs3teAwrnuJ1TTL/OJVBLBo9KRPKdla1p7KPcqtzyXhf8tViLxCVZn5UxCCmqjIGZa2rVtkE+
	7PQAmjzSU80cyFD7PdkTCmRIf0BoHz7GEiOSZAyM=
X-Received: by 2002:a17:907:3f13:b0:799:6aef:9837 with SMTP id hq19-20020a1709073f1300b007996aef9837mr26015405ejc.296.1667423406865;
        Wed, 02 Nov 2022 14:10:06 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7CZw/beWzRqidr4OqIWhXrscUKG9+V2zJU2OqIuxWhJ9aveyj9VDMZw5iFzWUINTTWItU8eUIO0AqjsOng2HE=
X-Received: by 2002:a17:907:3f13:b0:799:6aef:9837 with SMTP id
 hq19-20020a1709073f1300b007996aef9837mr26015389ejc.296.1667423406611; Wed, 02
 Nov 2022 14:10:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221102200527.4174076-1-jmontleo@redhat.com>
In-Reply-To: <20221102200527.4174076-1-jmontleo@redhat.com>
From: Jason Montleon <jmontleo@redhat.com>
Date: Wed, 2 Nov 2022 17:09:55 -0400
Message-ID: <CAJD_bPKZMXUi+-eKNzcB_vmj8Nd_a94Md=Vo7Pp7Rb=-nxnfJQ@mail.gmail.com>
Subject: Re: [PATCH] Fix kbl_rt5663_rt5514_max98927 regression
To: regressions@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

#regzbot introduced v5.19.17..v6.0-rc1

On Wed, Nov 2, 2022 at 4:05 PM Jason Montleon <jmontleo@redhat.com> wrote:
>
> Starting with 6.0-rc1 these messages are logged and the sound card
> is unavailable. Adding legacy_dai_naming to the rt5514-spi causes
> it to function properly again.
>
> [   16.928454] kbl_r5514_5663_max kbl_r5514_5663_max: ASoC: CPU DAI
> spi-PRP0001:00 not registered
> [   16.928561] platform kbl_r5514_5663_max: deferred probe pending
> ---
>  sound/soc/codecs/rt5514-spi.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/sound/soc/codecs/rt5514-spi.c b/sound/soc/codecs/rt5514-spi.c
> index 1a25a3787935..362663abcb89 100644
> --- a/sound/soc/codecs/rt5514-spi.c
> +++ b/sound/soc/codecs/rt5514-spi.c
> @@ -298,13 +298,14 @@ static int rt5514_spi_pcm_new(struct snd_soc_component *component,
>  }
>
>  static const struct snd_soc_component_driver rt5514_spi_component = {
> -       .name           = DRV_NAME,
> -       .probe          = rt5514_spi_pcm_probe,
> -       .open           = rt5514_spi_pcm_open,
> -       .hw_params      = rt5514_spi_hw_params,
> -       .hw_free        = rt5514_spi_hw_free,
> -       .pointer        = rt5514_spi_pcm_pointer,
> -       .pcm_construct  = rt5514_spi_pcm_new,
> +       .name                   = DRV_NAME,
> +       .probe                  = rt5514_spi_pcm_probe,
> +       .open                   = rt5514_spi_pcm_open,
> +       .hw_params              = rt5514_spi_hw_params,
> +       .hw_free                = rt5514_spi_hw_free,
> +       .pointer                = rt5514_spi_pcm_pointer,
> +       .pcm_construct          = rt5514_spi_pcm_new,
> +       .legacy_dai_naming      = 1,
>  };
>
>  /**
> --
> 2.37.3
>


-- 
Jason Montleon        | email: jmontleo@redhat.com
Red Hat, Inc.         | gpg key: 0x069E3022
Cell: 508-496-0663    | irc: jmontleo / jmontleon

