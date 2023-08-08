Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01317E57E
	for <regressions@lists.linux.dev>; Tue,  8 Aug 2023 11:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691492509; x=1723028509;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jHOYn9//8iPX+RoPt/5H1z0TENE0RN0IS8pVvDCFJC0=;
  b=hyjP69+jqeQcWvIzcQe1sJoLwPDXksOm65KG5HWYBDZxKUT+luqSJ79S
   UpnKvnq+eAsEeNsYzRyJBseLSFm4yM1ycvpuPfUhhXkEcJMnBQ5oUVTu+
   hOY/1M7QhuQK6Q7ghiAtXslfQFM2ayskw8mVeUqArinQpZTvdmiJy7m3N
   zvWCCUqkhUUHvigCecdx8XLHqMS0QSztUikdydxVbt4Aee4oH7VfAi1H7
   FdjVH5ns73NNAiBiSgKltX7yk94E9F2yfwA30p+kdxX5zHJexU1Z11Xc/
   l101GVDYE5znxIYK+qV4u8Mmtp1NoBqYXilEu7cAE8tQcHcHGQ7HDQlyc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="457176639"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="457176639"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 04:01:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="681198357"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="681198357"
Received: from romanagn-mobl1.ger.corp.intel.com (HELO [10.252.49.59]) ([10.252.49.59])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 04:01:45 -0700
Message-ID: <98188012-8e07-4bb1-be1c-04d6c0f5260a@linux.intel.com>
Date: Tue, 8 Aug 2023 14:03:09 +0300
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression fix not progressing towards mainline/stable
Content-Language: en-US
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: sound-open-firmware@alsa-project.org, LKML
 <linux-kernel@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Alsa-devel <alsa-devel@alsa-project.org>
References: <661fcece-a83c-cb24-1b37-5d8693b1fb94@leemhuis.info>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <661fcece-a83c-cb24-1b37-5d8693b1fb94@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Thorsten,

On 08/08/2023 09:10, Thorsten Leemhuis wrote:
> Hi everyone, I noticed a regression fix that afaics lingers in the
> thesofproject's git repo instead of progressing towards the stable trees
> and wondered what's up here.
>
> I'm talking about about the fix "ASoC: SOF: intel: hda: Clean up link
> DMA for IPC3 during stop" for this ticket:
> https://github.com/thesofproject/linux/issues/4455
> 
> Two more tickets about it:
> https://github.com/thesofproject/linux/issues/4482
> https://bugzilla.kernel.org/show_bug.cgi?id=217673
> 
> It seems the fix is ready and reviewed for two weeks now, but not even
> in -next by now. That's not how it should be for regression fixes, as
> per https://docs.kernel.org/process/handling-regressions.html it ideally
> should be in -stable soon or already. Is this a mistake, am I missing
> something, or is there a good reason for this?

We take regressions (and user reports) seriously and trying our best to
provide fixes asap.
We do prioritize bug fixes over features but in this case for some
reason the review process took longer than it usually does and the patch
has not been sent upstream. Patches must pass the review before they put
to the upstream queue.

I will be sending the fix in few minutes after testing it on top of next.

-- 
Péter
