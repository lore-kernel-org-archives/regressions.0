Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F48F9F4
	for <regressions@lists.linux.dev>; Mon, 11 Sep 2023 13:40:48 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qfh9i-0000KI-UM; Mon, 11 Sep 2023 15:40:46 +0200
Message-ID: <de698d06-9784-43ed-9437-61d6edf9672b@leemhuis.info>
Date: Mon, 11 Sep 2023 15:40:46 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: [PATCH] Bluetooth: hci_sync: Fix handling of
 HCI_QUIRK_STRICT_DUPLICATE_FILTER
Content-Language: en-US, de-DE
To: patchwork-bot+bluetooth@kernel.org,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 netdev <netdev@vger.kernel.org>, Stefan Agner <stefan@agner.ch>
References: <20230829205936.766544-1-luiz.dentz@gmail.com>
 <169343402479.21564.11565149320234658166.git-patchwork-notify@kernel.org>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <169343402479.21564.11565149320234658166.git-patchwork-notify@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1694439649;973ad249;
X-HE-SMSGID: 1qfh9i-0000KI-UM

On 31.08.23 00:20, patchwork-bot+bluetooth@kernel.org wrote:
> 
> This patch was applied to bluetooth/bluetooth-next.git (master)
> by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:
> 
> On Tue, 29 Aug 2023 13:59:36 -0700 you wrote:
>> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
>>
>> When HCI_QUIRK_STRICT_DUPLICATE_FILTER is set LE scanning requires
>> periodic restarts of the scanning procedure as the controller would
>> consider device previously found as duplicated despite of RSSI changes,
>> but in order to set the scan timeout properly set le_scan_restart needs
>> to be synchronous so it shall not use hci_cmd_sync_queue which defers
>> the command processing to cmd_sync_work.
>>
>> [...]
> 
> Here is the summary with links:
>   - Bluetooth: hci_sync: Fix handling of HCI_QUIRK_STRICT_DUPLICATE_FILTER
>     https://git.kernel.org/bluetooth/bluetooth-next/c/52bf4fd43f75

That is (maybe among others?) a fix for a regression from 6.1, so why
was this merged into a "for-next" branch instead of a branch that
targets the current cycle?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

[1] see
https://lore.kernel.org/linux-bluetooth/b0b672069ee6a9e43fed1a07406c6dd3@agner.ch/
