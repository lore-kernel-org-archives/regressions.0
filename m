Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B5CC952
	for <regressions@lists.linux.dev>; Tue, 21 Mar 2023 14:40:28 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pedA2-00073p-N4; Tue, 21 Mar 2023 15:40:26 +0100
Message-ID: <be785bbb-d77d-9930-56d0-dcef26f07bb2@leemhuis.info>
Date: Tue, 21 Mar 2023 15:40:26 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: kernel error at led trigger "phy0tpt"
Content-Language: en-US, de-DE
To: Tobias Dahms <dahms.tobias@web.de>, stable@vger.kernel.org,
 regressions@lists.linux.dev
Cc: linux-wireless@vger.kernel.org, linux-leds@vger.kernel.org
References: <91feceb2-0df4-19b9-5ffa-d37e3d344fdf@web.de>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <91feceb2-0df4-19b9-5ffa-d37e3d344fdf@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1679409628;96fd1984;
X-HE-SMSGID: 1pedA2-00073p-N4

On 20.03.23 20:44, Tobias Dahms wrote:
> Hello,
> 
> since some kernel versions I get a kernel errror while setting led
> trigger to phy0tpt.
> 
> command to reproduce:
> echo phy0tpt > /sys/class/leds/bpi-r2\:isink\:blue/trigger
> 
> same trigger, other led location => no error:
> echo phy0tpt > /sys/class/leds/bpi-r2\:pio\:blue/trigger
> 
> other trigger, same led location => no error:
> echo phy0tx > /sys/class/leds/bpi-r2\:isink\:blue/trigger
> 
> last good kernel:
> bpi-r2 5.19.17-bpi-r2
>
> error at kernel versions:
> bpi-r2 6.0.19-bpi-r2
> up to
> bpi-r2 6.3.0-rc1-bpi-r2+

Thx for the report.

"5.19.17-bpi-r2" sounds like a vendor kernel. Is that one that is
vanilla or at least close to vanilla? If not, you'll have to report this
to your kernel vendor. If not: could you try to bisect this?

> wireless lan card:
> 01:00.0 Network controller: MEDIATEK Corp. MT7612E 802.11acbgn PCI
> Express Wireless Network Adapter
> 
> distribution:
> Arch-Linux-ARM (with vanilla kernel instead of original distribution
> kernel)
> 
> board:
> BananaPi-R2

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
