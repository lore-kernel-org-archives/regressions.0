Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C5E7C
	for <regressions@lists.linux.dev>; Fri,  4 Nov 2022 10:39:26 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oqu6e-0003T0-JJ; Fri, 04 Nov 2022 11:39:24 +0100
Message-ID: <7cf21691-b01b-4316-63a5-7625753f2ac3@leemhuis.info>
Date: Fri, 4 Nov 2022 11:39:23 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: dpkg fails on sparc64 (was: [PATCH v4 4/7] mm/thp: Carry over
 dirty bit when thp splits on pmd) #forregzbot
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 sparclinux@vger.kernel.org
References: <20220811161331.37055-1-peterx@redhat.com>
 <20220811161331.37055-5-peterx@redhat.com>
 <20221021160603.GA23307@u164.east.ru>
 <6a02e9d4-690e-1f71-066a-c2d8bd811a0c@leemhuis.info>
In-Reply-To: <6a02e9d4-690e-1f71-066a-c2d8bd811a0c@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1667558367;b1c16c16;
X-HE-SMSGID: 1oqu6e-0003T0-JJ

On 23.10.22 15:33, Thorsten Leemhuis wrote:
> On 21.10.22 18:06, Anatoly Pugachev wrote:
>> Tried to update my debian sparc64 sid (unstable) linux distro to latest
>> version of available packages, got dpkg segfault... 
> #regzbot ^introduced 0ccf7f168e17bb7
> #regzbot title mm: sparc64: dpkg fails on sparc64 since "mm/thp: Carry
> over dirty bit when thp splits on pmd)"
> #regzbot ignore-activity

#regzbot fixed-by: 434e3d15d92b
