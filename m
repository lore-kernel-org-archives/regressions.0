Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5710E27719
	for <regressions@lists.linux.dev>; Wed,  2 Nov 2022 22:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667426717; x=1698962717;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=FS4e9nhVtW6hkotHWpM6LTMoaYsDhDQveLHvBrHl6HM=;
  b=VsXbYcbYwaEvPuxE+8nd4gGQYcP5Ll78bODrZbdbUdd2N9OoZYwtZZfD
   nV0bZjG+SYXVNskkjO5RqoTp8j8UUYIsqZVDLZY8l/BuOBvoyYHU5hA98
   8hx8YJ4c6Oyb0H2bmbmSvpsiFG5fybCtjIo5qOlm35g9Fy6EDt4o2oVF0
   JmS1KfNyhpGCeoUkLBZlSrmNun+8hqtKpaQvBO8bKFN2tNP5JPILR/L56
   GexSg9HDgP3TPob83yfxmqEroBZ5IShxuPrHPmxhj5Ev4FcPgdM2pqEvG
   iyXxe7slvUJfvVKUIxIDfp2jzBNaBojItJfk96fhXjRYsINCO6OcToQa5
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="296981081"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; 
   d="scan'208";a="296981081"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2022 15:05:16 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="585556710"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; 
   d="scan'208";a="585556710"
Received: from xuehongy-mobl1.amr.corp.intel.com (HELO [10.212.18.5]) ([10.212.18.5])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2022 15:05:16 -0700
Message-ID: <2bbe7bed-21d4-018a-8957-10d9dbe0c661@linux.intel.com>
Date: Wed, 2 Nov 2022 18:05:14 -0400
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH] Fix kbl_rt5663_rt5514_max98927 regression
To: Jason Montleon <jmontleo@redhat.com>, regressions@lists.linux.dev,
 oder_chiou@realtek.com, cezary.rojewski@intel.com,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20221102200527.4174076-1-jmontleo@redhat.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221102200527.4174076-1-jmontleo@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/2/22 16:05, Jason Montleon wrote:
> Starting with 6.0-rc1 these messages are logged and the sound card
> is unavailable. Adding legacy_dai_naming to the rt5514-spi causes
> it to function properly again.
> 
> [   16.928454] kbl_r5514_5663_max kbl_r5514_5663_max: ASoC: CPU DAI
> spi-PRP0001:00 not registered
> [   16.928561] platform kbl_r5514_5663_max: deferred probe pending

Thanks for reporting this regression, much appreciated.

a) you need to CC: maintainers Mark Brown and Takashi Iwai
b) the commit title should be something like "ASoC: rt5514: fix legacy
dai naming".
c) it's not clear if this is actually enough. there's no
legacy_dai_naming for e.g. rt5663 and the .endianness member is not set.

Adding Charles Keepax for comments.

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
> -	.name		= DRV_NAME,
> -	.probe		= rt5514_spi_pcm_probe,
> -	.open		= rt5514_spi_pcm_open,
> -	.hw_params	= rt5514_spi_hw_params,
> -	.hw_free	= rt5514_spi_hw_free,
> -	.pointer	= rt5514_spi_pcm_pointer,
> -	.pcm_construct	= rt5514_spi_pcm_new,
> +	.name			= DRV_NAME,
> +	.probe			= rt5514_spi_pcm_probe,
> +	.open			= rt5514_spi_pcm_open,
> +	.hw_params		= rt5514_spi_hw_params,
> +	.hw_free		= rt5514_spi_hw_free,
> +	.pointer		= rt5514_spi_pcm_pointer,
> +	.pcm_construct		= rt5514_spi_pcm_new,
> +	.legacy_dai_naming	= 1,
>  };
>  
>  /**
