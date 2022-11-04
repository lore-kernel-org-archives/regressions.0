Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E99F7C
	for <regressions@lists.linux.dev>; Fri,  4 Nov 2022 12:06:15 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oqvSf-0007ER-Bc; Fri, 04 Nov 2022 13:06:13 +0100
Message-ID: <77db7bb2-5f4c-273f-6e15-d4d397c44745@leemhuis.info>
Date: Fri, 4 Nov 2022 13:06:13 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: BISECT result: 6.0.0-RC kernels trigger Firefox snap bug with
 6.0.0-rc3 through 6.0.0-rc7 #forregzbot
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: regressions@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <8702a833-e66c-e63a-bfc8-1007174c5b3d@leemhuis.info>
 <20221015205936.5735-1-phillip@squashfs.org.uk>
 <2d1ca80c-1023-9821-f401-43cff34cca86@gmail.com>
 <b811fb3a-b5bb-bb0d-0cdf-e5bc0e88836f@gmail.com>
 <6e744247-60b8-febb-9cc6-5c24ff6e3019@leemhuis.info>
In-Reply-To: <6e744247-60b8-febb-9cc6-5c24ff6e3019@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1667563575;73b65994;
X-HE-SMSGID: 1oqvSf-0007ER-Bc

[Note: this mail is primarily send for documentation purposes and/or for
regzbot, my Linux kernel regression tracking bot. That's why I removed
most or all folks from the list of recipients, but left any that looked
like a mailing lists. These mails usually contain '#forregzbot' in the
subject, to make them easy to spot and filter out.]

On 16.10.22 14:43, Thorsten Leemhuis wrote:
> #regzbot introduced: b09a7a036d2035b14636c

#regzbot fixed-by: e11c4e088be
