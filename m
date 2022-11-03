Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9997488
	for <regressions@lists.linux.dev>; Thu,  3 Nov 2022 15:11:08 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A34Raid013092;
	Thu, 3 Nov 2022 10:06:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=VSKkQlCAvlfq+PjIDvYqLxIkd3eAOqv2nWa7XM9kWKg=;
 b=Bi6rVkvtJw8HgmNdd2EQgLdjJ7GIHPtYf9BafcGx3j145O+8k2XJn9Sxz7xWHlzPFZG+
 HQE6BEYDEW3VDKqpxIGMMEwe4nhnbmdsc5hjwauUpR4IkAlNC23yBDCwPeScmlViGqcV
 bcoRKif/dcqi2Wu2uPWbZUYsozEo2Fpd2dfiTcsPiBgPiEC954GgiyYwG5Jh7L3kjytg
 aJ671lGxiI79ctaBRuqEJ7cogo9YWBIlbkJMAbyxSNdX/xI9WZB0IYr7XmUtLK0pixda
 JTwXUaBeDulQAuzb6XzqbGIzDMO+wlNHr5vQaMNWuSoCmqgkEm+PjoYt57aC5xiehtK8 Yg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3kh0kppdmy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Nov 2022 10:06:51 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.15; Thu, 3 Nov
 2022 10:06:49 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.15 via Frontend Transport; Thu, 3 Nov 2022 10:06:49 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 979CC45A;
	Thu,  3 Nov 2022 15:06:49 +0000 (UTC)
Date: Thu, 3 Nov 2022 15:06:49 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Jason Montleon <jmontleo@redhat.com>
CC: <pierre-louis.bossart@linux.intel.com>, <alsa-devel@alsa-project.org>,
        <broonie@kernel.org>, <cezary.rojewski@intel.com>,
        <oder_chiou@realtek.com>, <regressions@lists.linux.dev>,
        <tiwai@suse.com>, <stable@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] ASoC: rt5514: fix legacy dai naming
Message-ID: <20221103150649.GB10437@ediswmail.ad.cirrus.com>
References: <20221103144612.4431-1-jmontleo@redhat.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221103144612.4431-1-jmontleo@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: d-IM0Gu1Jg-Sf_lZ1-tsbl8f8vl0QWnI
X-Proofpoint-GUID: d-IM0Gu1Jg-Sf_lZ1-tsbl8f8vl0QWnI
X-Proofpoint-Spam-Reason: safe

On Thu, Nov 03, 2022 at 10:46:11AM -0400, Jason Montleon wrote:
> Starting with 6.0-rc1 these messages are logged and the sound card
> is unavailable. Adding legacy_dai_naming to the rt5514-spi causes
> it to function properly again.
> 
> [   16.928454] kbl_r5514_5663_max kbl_r5514_5663_max: ASoC: CPU DAI
> spi-PRP0001:00 not registered
> [   16.928561] platform kbl_r5514_5663_max: deferred probe pending
> 
> Fixes: fc34ece41f71 ("ASoC: Refactor non_legacy_dai_naming flag")
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=216641
> Signed-off-by: Jason Montleon <jmontleo@redhat.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
