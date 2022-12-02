Received: from mail1.systemli.org (mail1.systemli.org [93.190.126.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6F27B
	for <regressions@lists.linux.dev>; Fri,  2 Dec 2022 12:25:38 +0000 (UTC)
Message-ID: <cb0f0500-fb8a-2a01-1dd4-ab50714f595a@systemli.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=systemli.org;
	s=default; t=1669983934;
	bh=YTGNx4NCeKJU4fs8LfpcSENPzliYiuPpYxnwWXBphdM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LoRXeBe8rc2rAqLoxHYOfYxt1KWheZkWGYLPv786F17jnfI7WwEK6MrY13y4F1uKh
	 h/KQm7qX/fNgPwuvU7GQpHJ66QuAn0VmuMkwq+TcGbt1ragwj5OIr+9ntfYe/2L5a3
	 Vr9dwo8JIC/pyUrchvJwTuD+einYbK2Fcoqf/escuzca7lWrsNNYOWZolftpCpB/5d
	 UwkhFju4UHL0/YscTOH+qhDC/JJ2DX+Ch6uFTwTUDKkyb3g1rZp4rp3rQDN4CdZje+
	 gV+CwvfzaDRax4aVaFy2TsDe6UFtoEtFuqS1/pJJDpsUFrk8Z5C0B52RB1hG38gfoa
	 UXre3yk8/AatA==
Date: Fri, 2 Dec 2022 13:25:31 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: Kernel Kernel bug caused by (cpufreq: mediatek: Refine
 mtk_cpufreq_voltage_tracking()) on Banana Pi R64 (MT7622)
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsyk=?=
 <Allen-KH.Cheng@mediatek.com>,
 "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>
Cc: "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "frank-w@public-files.de" <frank-w@public-files.de>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?SmlhLXdlaSBDaGFuZyAo5by15L2z5YGJKQ==?=
 <Jia-wei.Chang@mediatek.com>, =?UTF-8?B?UmV4LUJDIENoZW4gKOmZs+afj+i+sCk=?=
 <Rex-BC.Chen@mediatek.com>,
 "thomas.huehn@hs-nordhausen.de" <thomas.huehn@hs-nordhausen.de>,
 "daniel@makrotopia.org" <daniel@makrotopia.org>
References: <930778a1-5e8b-6df6-3276-42dcdadaf682@systemli.org>
 <eb142a22-b35e-ec3f-ee0a-9e3e7b24cea6@gmail.com>
 <bf8d2a8f-7654-29be-1104-a842c6657b5e@systemli.org>
 <02c2c955-940b-b315-0474-85d0eddad7a3@leemhuis.info>
 <Y4jHvomTrU8guBox@makrotopia.org>
 <47a4665e-333d-a6e7-a2da-96cb06c2d87b@leemhuis.info>
 <20221202052716.uj3kzkunazmgazeq@vireshk-i7>
 <0ebef1a2-6b5a-04b9-a79b-79eb3349c32b@collabora.com>
 <c76bd301-0e8d-2d2b-0d3e-a57ece9b496f@collabora.com>
 <b1822bbc3775730c4cedf9652323c7d72e663e4b.camel@mediatek.com>
 <8be3e050-f32a-6761-8ebd-49c38dfcf9eb@collabora.com>
 <c186d104-43e0-ca10-3ce2-c2f922acd8bf@leemhuis.info>
Content-Language: en-US
From: Nick <vincent@systemli.org>
In-Reply-To: <c186d104-43e0-ca10-3ce2-c2f922acd8bf@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/2/22 11:41, Thorsten Leemhuis wrote:

> Reported-by: Nick<vincent@systemli.org>
You can also use "Reported-by: Nick Hainke <vincent@systemli.org>" ;)

