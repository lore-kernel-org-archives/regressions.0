Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CB31841;
	Sat,  8 Apr 2023 12:10:43 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pl7Oz-00054B-Ak; Sat, 08 Apr 2023 14:10:41 +0200
Message-ID: <1f0ebf13-ab0f-d512-6106-3ebf7cb372f1@leemhuis.info>
Date: Sat, 8 Apr 2023 14:10:40 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US, de-DE
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 workflows@vger.kernel.org, aros@gmx.com, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, tools@linux.kernel.org
References: <gmnswy45efztvcyc3xqymm52h7cdfwjz64go2wy3zyeqcqwb76@36fva4hyip4q>
From: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Kalle Valo <kvalo@kernel.org>
Subject: Re: Introducing bugbot
In-Reply-To: <gmnswy45efztvcyc3xqymm52h7cdfwjz64go2wy3zyeqcqwb76@36fva4hyip4q>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1680955843;6a904c9d;
X-HE-SMSGID: 1pl7Oz-00054B-Ak

CCing Kalle (JFYI)

On 03.04.23 23:45, Konstantin Ryabitsev wrote:
> 
> 2. Start mailing list threads from pre-triaged bugzilla bugs. This works the
>    opposite way and creates mailing list threads based on bug reports filed in
>    bugzilla. The useful things here are:
> 
>    - bugbot only gets triggered on open bugs in Linux/Kernel that have the
>      "bugbot" flag set to "+", which allows pre-triaging a bug before bugbot
>      sends it to the mailing list
> [...]

Are there any policies or best practices on how people should/are
allowed to use this? From what I can see it seems one needs to change
the Product/Component of the bug to start a thread. I wonder if a few
maintainers that are active in bugzilla might be annoyed by this, as
that might break their workflow.

Which puts me in an awkward position when I see regressions reports in
bugzilla and would like to create threads for them. Using bugbot would
be better then the manual forwards I do now, like this one:

https://lore.kernel.org/all/ed31b6fe-e73d-34af-445b-81c5c644d615@leemhuis.info/


But here I decided to *not* use bugbot, as I know Kalle sometimes is
active in bugzilla -- and thus might hate it, if I re-categorize the bug.

Ciao, Thorsten
