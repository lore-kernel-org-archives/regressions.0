Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB99C37C
	for <regressions@lists.linux.dev>; Thu, 16 Mar 2023 02:17:54 +0000 (UTC)
X-QQ-mid: bizesmtp69t1678932083t9enazw6
Received: from [10.4.16.24] ( [58.240.82.166])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 16 Mar 2023 10:01:22 +0800 (CST)
X-QQ-SSF: 01400000000000I0Z000000A0000000
X-QQ-FEAT: HPkwb3INVpCkD+eN/AbJL1aye0ngp8ExXZNAlsIxfdcXhygZjrvR7Vi7OvtGI
	WSIbE5OF+UDpoXSfmatWabhKHemR+EtxsGJnlWoodLK/J0zsVD0vI4SyCEY47qKHTNZYgIw
	N+K59owGBp3Kh7YLarR5XTV2nRPDrpysFSj2TYE6pVvKyvsPatUw5e2I56CD+9qZRZ0tM+i
	vWVyKw+1Dltcm0L5je8TyBhs/OhyqR6QCl7S7QCTGbGLu0zeNCd5vqrzo2fg7K+PeIctVDj
	TVXJrye+CorIGApY7aSqCi7/CL13fmWoXQbj39ratlDeagNK9KTPIYI7ux4+zygoVD+Ge2I
	EoNKjho8378i1xNGuzc48yLAi/nXQipRV4mgaT7idoLyooG7SKWIMaa3Hspyw==
X-QQ-GoodBg: 1
Message-ID: <927A9CC7D19E5BD6+6758c124-1a86-a981-d3cf-fa0da9ab589e@uniontech.com>
Date: Thu, 16 Mar 2023 10:01:22 +0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [REGRESSION] External mic not working on Lenovo Ideapad U310,
 ALSA: hda/conexant: Add quirk for LENOVO 20149 Notebook model
To: Takashi Iwai <tiwai@suse.de>, Jetro Jormalainen <jje-lxkl@jetro.fi>
Cc: regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20230308215009.4d3e58a6@mopti> <87o7ou9jfi.wl-tiwai@suse.de>
From: tangmeng <tangmeng@uniontech.com>
In-Reply-To: <87o7ou9jfi.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvr:qybglogicsvr7


On 2023/3/15 22:29, Takashi Iwai wrote:

> 
> Sounds like multiple models using the same PCI SSID.
> Could you share the alsa-info.sh output?
> Meng, also could you give alsa-info.sh output of Lenovo 20149, too?
> 
> 
Sorry, because the environment used before belongs to the customer's 
environment, the environment has been returned to the customer after the 
verification is completed.
Output information is no longer available.

