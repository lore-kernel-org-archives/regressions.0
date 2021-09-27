Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087F63FC8
	for <regressions@lists.linux.dev>; Mon, 27 Sep 2021 11:26:01 +0000 (UTC)
Received: from ip4d14bdef.dynamic.kabel-deutschland.de ([77.20.189.239] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1mUold-0001hE-VN; Mon, 27 Sep 2021 13:25:54 +0200
Message-ID: <7a27099a-efae-be50-bc88-1ee02bf0461c@leemhuis.info>
Date: Mon, 27 Sep 2021 13:25:53 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-BS
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <CAH4F6usFu8-A6k5Z7rU9__iENcSC6Zr-NtRhh_aypR74UvN1uQ@mail.gmail.com>
 <87o88muvvz.fsf@codeaurora.org>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: Bug in Memory Layout of rx_desc for QCA6174
In-Reply-To: <87o88muvvz.fsf@codeaurora.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1632741962;afe84a3a;
X-HE-SMSGID: 1mUold-0001hE-VN


On 21.09.21 11:21, Kalle Valo wrote:
> (adding linux-wireless and regression lists)
> 
> Francesco Magliocca <franciman12@gmail.com> writes:
> 
>> Hello everyone,
>> I have a QCA6174 PCIe board, I am using linux kernel 5.12.10.
>> The firmware loaded is:
>>> [ 4.483131] ath10k_pci 0000:02:00.0: qca6174 hw3.2 target 0x05030000
>>> chip_id 0x00340aff sub 1a56:143a
>>> [ 4.483136] ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 1
>>> tracing 0 dfs 0 testmode 0
>>> [ 4.483567] ath10k_pci 0000:02:00.0: firmware ver
>>> WLAN.RM.4.4.1-00157-QCARMSWPZ-1 api 6 features wowlan,ignore-otp,mfp
>>> crc32 90eebefb
>>> [    4.572730] ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A crc32 318825bf
>>> [ 4.665592] ath10k_pci 0000:02:00.0: htt-ver 3.60 wmi-op 4 htt-op 3
>>> cal otp max-sta 32 raw 0 hwcrypto 1
>>
>> around six months ago I reported a bug which is still haunting me:
>> When I am connected to my home's Wi-Fi network and my father's Huawei
>> smartphone is connected too
>> my Wi-Fi card hangs and gets stuck, I have to force restart of the device.
>>
>> Note that this problem does not happen if my pc and the smartphone are
>> connected to different networks (for example
>> I tried connecting my pc to the 2.4GHz network and the smartphone to
>> the 5GHz network, and the bug does not appear).
>>
>> Now, I tried bisecting driver changes, and I found the faulty one,
>> it is the commit: e3def6f7ddf88636febb12e1e3e86387a4ce5452

Feel free to ignore this message. I write it to make regzbot track above
issue. Regzbot is the regression tracking bot I'm working on. It's still
in the early stages and this is still one of the first few regression I
make it track to get started and things tested in the field. That also
why I'm sending the mail just to the regressions list (it will do its
fully magic nevertheless). For details see:
https://linux-regtracking.leemhuis.info/post/inital-regzbot-running/
https://linux-regtracking.leemhuis.info/post/regzbot-approach/

#regzbot ^^introduced e3def6f7ddf88636febb12e1e3e86387a4ce5452

Ciao, Thorsten
