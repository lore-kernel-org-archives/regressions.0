Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D237917F
	for <regressions@lists.linux.dev>; Sun,  8 Aug 2021 22:27:41 +0000 (UTC)
Received: from [192.168.10.241] ([80.152.235.138]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M5fQq-1mBC6609Oc-0079MQ; Mon, 09 Aug 2021 00:14:00 +0200
Subject: Re: regression [fixed]: SPI interface on systems with Mediatek CPU
 broken
To: Guenter Roeck <linux@roeck-us.net>, regressions@lists.linux.dev
Cc: stable <stable@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Frank Wunderlich <frank-w@public-files.de>, Mark Brown <broonie@kernel.org>
References: <d865ef60-034e-32ab-3978-601b97d8904e@roeck-us.net>
From: Peter Hess <peter.hess@ph-home.de>
Message-ID: <f17640a6-1521-3620-f775-d182ad412f3c@ph-home.de>
Date: Mon, 9 Aug 2021 00:13:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <d865ef60-034e-32ab-3978-601b97d8904e@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:d+36i6A+R8XQZJfwdv6CUDupbGgZHBKR/5rs94Z+ccRdbKcKv70
 6seq7oW/3O9yas5geclN7JPjmxfT6zEFnk2guzccfyMPM9cteFNcQgDt1axSGQTy40Nc+db
 D83yp/gVU7StAIpRO99igW5nmWTUIAuV3EqtpoHiWV9uyHAXvhW7su5Nzofm+DxytGlw5+g
 TftFLQdfd5PpZ0MgyEKvg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dMj3UzPgLJo=:AG+5FRH7CQ+5Qr/A45X4Ry
 9RQi02X1F/8n48LdUma7yStHCIqsDmXJ2xo52jlEzdukhNEqE4EmjFoYtWG3Ei90P9FSgpgHj
 OQ1Blnm4GDqQV2VQ7lXnOiiYSOIzkKF3sXOdwSKx4aSlSqLp7G0EUuxOMU5DH472gONXuhEaH
 De/KVS5dTkRNKOjvBdICslRDlEewtkoCPVUWmLc61KgPQtRYTd6zMef78R14dMgDpKzmWnDE3
 wIw4edNptkAaKNF8geonr79voH0d2EyC0IKuuxUVjz3HSamrKpxMgTPoUSoR0V2evA/0t7AM4
 UfEekYQu2irVkSwBF9lN2jKqSSg0STskF8LoXxaL9SF2UVWHSHAPzg32J6FmMX/yYwICt7det
 VRbT0iY2Mh9IJwXVEfhJk+Ohrg68aREJw3mAzLOk74PQrS4/otymh5FvbSYG7919w0MNI0LoC
 TPmK8xEodzp5RgjTir/FTrbPspPhmxYlTnSFkUGRGy1VVEdO+jRsoDyrJD9Dkak0bPJy/s07X
 FDzY8mnvJIAChHoRAUT1CZFPRu1up2f/Kk64hTMR96P2j6TLphMl9jxwpvYDjiXa+9ounoxXw
 tIv3FutKkUwrluGkEvDLFiCLfZXL3qa+B4i3Fv5dRzbmufBlNo8JSRVHCtWpYHoEsXIKZ9TTg
 i7H4ps2LDTvf+IX3QUKPFSyvBqCffMDKzkDJRh3OvjoL/BF4RnwWw0z3NlUgREvrgnAPIPYi0
 UaQMi+bIlRCxQhhGLKvLuw3w8rlJrZGWV2Z+bm1rYmyHvj1Jp2BiODX/B49H3b6kfol1zV0+6
 R/wfRO2Npk3JkjZ68YXBZI7dezcd3Y0W72b3zSBvkfGaPl/+kEY3xfXtRCCC5HH+WBwoxEb

Hello everyone,

I would like to apologize for the inconvenience caused by my submitted 
patch. I should have looked deeper into the driver, then this would not 
have happened with the RX path.  Unfortunately, the faulty patch still 
worked on my system and so I didn't realize the error. In the future I 
will pay more attention to the whole context in the hope that this will 
not happen again.

Peter


Am 07.08.2021 um 00:33 schrieb Guenter Roeck:
> [ submitted for reference. The problem has now been fixed in the 
> upstream kernel ]
>
> Affected upstream kernel releases: v5.14-rc3, v5.14-rc4
> Various stable releases with the problematic commit are also affected.
>
> The SPI interface on systems with various Mediatek CPUs is not 
> operational.
> The problem affects all Chromebooks with Mediatek CPU since those 
> Chromebooks
> use the SPI interface to connect to the Embedded Controller.
>
> Bisect suggests that commit 3a70dd2d050 ("spi: mediatek: fix fifo rx 
> mode")
> introduced the problem. The problem was fixed with upstream commit 
> 0d5c3954b35e
> ("spi: mediatek: Fix fifo transfer").
>
> Detailed problem description from commit 0d5c3954b35e:
>
>     Commit 3a70dd2d0503 ("spi: mediatek: fix fifo rx mode") claims that
>     fifo RX mode was never handled, and adds the presumably missing code
>     to the FIFO transfer function. However, the claim that receive data
>     was not handled is incorrect. It was handled as part of interrupt
>     handling after the transfer was complete. The code added with the 
> above
>     mentioned commit reads data from the receive FIFO before the transfer
>     is started, which is wrong. This results in an actual transfer error
>     on a Hayato Chromebook.
>
>     Remove the code trying to handle receive data before the transfer is
>     started to fix the problem.
>
> Guenter

