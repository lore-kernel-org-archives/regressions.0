Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619C92F2C
	for <regressions@lists.linux.dev>; Fri, 24 Mar 2023 19:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679684729; x=1711220729;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=X9n+yet3Mi5pd0MngLxWhEELp+DUWqRTDu9B5UBwZKc=;
  b=TvKD7vlV4WRV/a+qz4dACLIATghGdGEFyR0g7YKe0hTjWZqx/x4N5zLO
   VuCOPLES14AYPXhlkFkVd7J9uMm6fwltEx5XslPZT2wUrU0zgJOJBGQ0F
   AlFWzotTukQwIQRpbTVHgrIYUfBfKcb77aSjV0Q8LEK6VjZ+zhec+0xad
   qMueR2zr7ZI/EAzhamDk6zY4+0BuZH1DSK0rb6m3uZ98HLJqYmvEg7hXP
   qj2mRAw2beYEMdeCLjOP3XTKWhTycK/ORa9zn/yFZSDdI+HuH++IMFHpj
   Lr5RIICjPQ7Y3V6rr+x6KQ+Zx7Z+lpNiMJumM6UsIdWt6irhWUIsMIVSF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="338585079"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="338585079"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 12:05:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="632936329"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="632936329"
Received: from kvnguye3-mobl1.amr.corp.intel.com (HELO [10.212.145.31]) ([10.212.145.31])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 12:05:26 -0700
Message-ID: <060ebffd-6ecd-f2f7-6fdf-5e7b8c544d0a@linux.intel.com>
Date: Fri, 24 Mar 2023 14:05:25 -0500
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [PATCH] ASoC: hdac_hdmi: use set_stream() instead of
 set_tdm_slots()
To: Jason Montleon <jmontleo@redhat.com>, alsa-devel@alsa-project.org,
 regressions@lists.linux.dev, yung-chuan.liao@linux.intel.com,
 broonie@kernel.org, tiwai@suse.com, bagasdotme@gmail.com
Cc: stable@vger.kernel.org
References: <20230324170711.2526-1-jmontleo@redhat.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230324170711.2526-1-jmontleo@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/24/23 12:07, Jason Montleon wrote:
> hdac_hdmi was not updated to use set_stream() instead of set_tdm_slots()
> in the original commit so HDMI no longer produces audio.
> 
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/regressions/CAJD_bPKQdtaExvVEKxhQ47G-ZXDA=k+gzhMJRHLBe=mysPnuKA@mail.gmail.com/
> Fixes: 636110411ca7 ("ASoC: Intel/SOF: use set_stream() instead of set_tdm_slots() for HDAudio")
> Signed-off-by: Jason Montleon <jmontleo@redhat.com>

Good catch indeed. Thanks Jason!

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
