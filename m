Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B837488
	for <regressions@lists.linux.dev>; Thu,  3 Nov 2022 15:07:22 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A36QhvN003553;
	Thu, 3 Nov 2022 10:07:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=TcxZDwlXKPQCCqdzTr2pfzo7RdcE3/NIsDb8Wx6Kb+8=;
 b=d1y74jJUjQQw/YuT32crpeodLqJpRMGjOXz1xMsBW0IoU4hUXEPeT3LDs2GlUa+q8yDU
 BVGdqz94acG4Ls3fqdh185v1w1k4iOIhb6tvEMXaINpex4A+IBob9LUsBR5XG+qKmGVc
 3wThKKUIrRnCT4pGwDDMvGJVDm4n9noyFkpu2FA89MH+3lv2ryM2Z4JEoGRF9/NnK6Oj
 JPd5zEDovAoKygbWPbNzfHvav81v0BTrvSj+IFwkDgd95Ib/W9YYZFd1V/glesVgSJqO
 h5IBmwSSJJxc5rA29nXxbpTNfgOZB3pZ1lPPVugosVx6vLmcwZzKwlCBmLb4LNe3imO1 wg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3kh1k1efuk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Nov 2022 10:07:02 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.15; Thu, 3 Nov
 2022 10:07:00 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.15 via Frontend Transport; Thu, 3 Nov 2022 10:07:00 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 20F332AA;
	Thu,  3 Nov 2022 15:07:00 +0000 (UTC)
Date: Thu, 3 Nov 2022 15:07:00 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Jason Montleon <jmontleo@redhat.com>
CC: <pierre-louis.bossart@linux.intel.com>, <alsa-devel@alsa-project.org>,
        <broonie@kernel.org>, <cezary.rojewski@intel.com>,
        <oder_chiou@realtek.com>, <regressions@lists.linux.dev>,
        <tiwai@suse.com>, <stable@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] ASoC: rt5677: fix legacy dai naming
Message-ID: <20221103150700.GC10437@ediswmail.ad.cirrus.com>
References: <20221103144612.4431-1-jmontleo@redhat.com>
 <20221103144612.4431-2-jmontleo@redhat.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221103144612.4431-2-jmontleo@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: 3JXg8iWZ1IgOwI4Dv6wWBf9mpFDxm1A9
X-Proofpoint-GUID: 3JXg8iWZ1IgOwI4Dv6wWBf9mpFDxm1A9
X-Proofpoint-Spam-Reason: safe

On Thu, Nov 03, 2022 at 10:46:12AM -0400, Jason Montleon wrote:
> Starting with 6.0-rc1 the CPU DAI is not registered and the sound
> card is unavailable. Adding legacy_dai_naming causes it to function
> properly again.
> 
> Fixes: fc34ece41f71 ("ASoC: Refactor non_legacy_dai_naming flag")
> Signed-off-by: Jason Montleon <jmontleo@redhat.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
