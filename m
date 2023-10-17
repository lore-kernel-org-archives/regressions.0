Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A648813
	for <regressions@lists.linux.dev>; Tue, 17 Oct 2023 06:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qsdC9-0002Cw-RU; Tue, 17 Oct 2023 08:04:45 +0200
Message-ID: <9a3e9c6a-e8fd-4fc6-8959-c90fda78ae4c@leemhuis.info>
Date: Tue, 17 Oct 2023 08:04:45 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Bluetooth: btrtl: Ignore error return for
 hci_devcd_register()
Content-Language: en-US, de-DE
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>
Cc: patchwork-bot+bluetooth@kernel.org, Max Chou <max.chou@realtek.com>,
 marcel@holtmann.org, johan.hedberg@gmail.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 alex_lu@realsil.com.cn, hildawu@realtek.com, kirill@shutemov.name,
 bagasdotme@gmail.com
References: <20231006024707.413349-1-max.chou@realtek.com>
 <169664042379.23949.8315443049400174883.git-patchwork-notify@kernel.org>
 <0ee79296-a404-4d0d-b8ed-42578a77692c@leemhuis.info>
 <CABBYNZ+DcF=q3tH9ZYTEhsrPgygU+hsYwYNEZf-3VwuiyzHXog@mail.gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <CABBYNZ+DcF=q3tH9ZYTEhsrPgygU+hsYwYNEZf-3VwuiyzHXog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1697522688;c9bd8d2c;
X-HE-SMSGID: 1qsdC9-0002Cw-RU

On 16.10.23 19:20, Luiz Augusto von Dentz wrote:
> 
> On Mon, Oct 16, 2023 at 1:07 AM Linux regression tracking (Thorsten
> Leemhuis) <regressions@leemhuis.info> wrote:
>>
>> On 07.10.23 03:00, patchwork-bot+bluetooth@kernel.org wrote:
>>>
>>> This patch was applied to bluetooth/bluetooth-next.git (master)
>>> by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:
>>
>> Hi Luiz. Many thx for picking this up. From the branch name is sounds
>> like you plan to submit this change in the next merge window (If I
>> misread the signs feel free to ignore this mail!). Wouldn't it be better
>> to merge this in this cycle, as the commit afaics fixes a regression
>> that was only introduced this cycle?
> 
> It is part of the for-net pull-request:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git/tag/?h=for-net-2023-10-13

Ahh, great -- and sorry, the branch name in the "was applied to
bluetooth/bluetooth-next.git" got me on the wrong track.

Ciao, Thorsten
