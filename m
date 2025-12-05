Received: from c.mail.sonic.net (c.mail.sonic.net [64.142.111.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A86828727E
	for <regressions@lists.linux.dev>; Fri,  5 Dec 2025 02:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.142.111.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764900588; cv=none; b=cb/fkukbB/G2ofKmEegV/iGWf9ypf0kgK26XcA7m6zwN3BAQUh08s5QJRdd9Mv3SOKJHIJt6s5fQ28jRIEY2dQexdwaHdZpEmBmHBFSNhsWjZjAJ8uCpk92LCFp2QPrpywgOnjW8jAp4wFD+D9mttMxJsl2m93ieijNtzbISgTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764900588; c=relaxed/simple;
	bh=hIqeV/BRPxi6EoqsYAjOfXGn0mhupQAJAnEXUcaruIg=;
	h=From:To:Cc:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=XA5qDMRWnC2tiK2/SvayUJQTHmHCcK1APkaj9J7RlgoE6HbutCozKklUU0CLSpa8aXOyUIsqz7zhAxhr8ClgUD6cR9pTmRqcWXfIAkmdAKSAxCpC8WicEJeaRHa/rZr2gt22lM91aCZHit+ssSbbienl7wDY2s3thvNZ3ulzcFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gaga.casa; spf=pass smtp.mailfrom=gaga.casa; arc=none smtp.client-ip=64.142.111.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gaga.casa
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gaga.casa
Received: from 192-184-191-252.static.sonic.net (192-184-191-252.static.sonic.net [192.184.191.252])
	(authenticated bits=0)
	by c.mail.sonic.net (8.16.1/8.16.1) with ESMTPA id 5B51uMpt021374;
	Thu, 4 Dec 2025 17:56:22 -0800
From: Forest <forestix@gaga.casa>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Stefan Eichenberger <stefan.eichenberger@toradex.com>,
        Pawel Laszczak <pawell@cadence.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION][BISECTED] usb: hub: total system freeze after running adb
Date: Thu, 04 Dec 2025 17:56:22 -0800
Message-ID: <fod4jk1tp199qsvqqlspl45nf29i5k3c0i@sonic.net>
References: <qc0nhk9c6l0a08bkfeplrm3qjssgrjkvkp@sonic.net> <cc788286-c327-4b1f-adb4-8494c0145d74@linux.intel.com> <bu3vhk5i8pttoi6t8fan58lpe7l2eb12ib@sonic.net> <f8ee4a2f-6b95-4f91-9ffc-b7df45464d46@linux.intel.com>
In-Reply-To: <f8ee4a2f-6b95-4f91-9ffc-b7df45464d46@linux.intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Sonic-CAuth: UmFuZG9tSVawqi2mw7B09qyvgwry2fXRAypcwOxiUQ6BQDbXnVrySZX5mAiUrfgXMwWqPnRJBYsHxxAEtANfXzAEfLmf59LF
X-Sonic-ID: C;MuxRmX3R8BGFb676uCp4aA== M;VFSamX3R8BGFb676uCp4aA==
X-Spam-Flag: No
X-Sonic-Spam-Details: 0.0/5.0 by cerberusd

On Thu, 4 Dec 2025 01:41:37 +0200, Mathias Nyman wrote:

>If possible, could you try with the same usb debugging enabled as last time,
>and add HUNG_TASK debugging entries in kernel config:
>
>CONFIG_DETECT_HUNG_TASK=y
>CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=30
>CONFIG_DETECT_HUNG_TASK_BLOCKER=y
>
>And add the following patch to hub driver:

That patch failed to apply, due to tab/space differences. I guess Thunderbird
might have taken liberties when you sent it. It was easy enough to make those
edits by hand, though.

The result was again bursts of dmesg output roughly once per second, this time
107 lines each. I compared the last three bursts that made it to my redirected
output file, and they were again the same except for timestamps and a few lines
being reordered.

A screen photo once again shows newer timestamps than the file. I did not
read every line in the photo to compare it with the log file, but the last
dozen lines look the same. I suppose I can send you the photo if you like.

Here is the last dmesg burst that was captured in the file:


[ 2875.178933] xhci_hcd 0000:0f:00.0: Setting command ring address to 0xffffe001
[ 2875.179881] xhci_hcd 0000:0f:00.0: xhci_resume: starting usb7 port polling.
[ 2875.179884] xhci_hcd 0000:0f:00.0: xhci_hub_status_data: stopping usb7 port polling
[ 2875.179886] xhci_hcd 0000:0f:00.0: hcd_pci_runtime_resume: 0
[ 2875.179890] usb usb7: usb auto-resume
[ 2875.179895] hub 7-0:1.0: hub_resume
[ 2875.179899] xhci_hcd 0000:0f:00.0: Get port status 7-1 read: 0x2a0, return 0x100
[ 2875.179974] hub 7-0:1.0: state 7 ports 1 chg 0000 evt 0000
[ 2875.179979] hub 7-0:1.0: hub_suspend
[ 2875.179981] hub 7-0:1.0: HUBHANG hub_suspend+0xf1/0x250 [usbcore] -> hub_quiesce() flush post resume work
[ 2875.179996] hub 7-0:1.0: HUBHANG post resume work flush not needed
[ 2875.180005] usb usb7: bus auto-suspend, wakeup 1
[ 2875.180009] xhci_hcd 0000:0f:00.0: xhci_hub_status_data: stopping usb7 port polling
[ 2875.180013] xhci_hcd 0000:0f:00.0: config port 7-1 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
[ 2875.180015] xhci_hcd 0000:0f:00.0: xhci_suspend: stopping usb7 port polling.
[ 2875.180029] xhci_hcd 0000:0f:00.0: Setting command ring address to 0xffffe001
[ 2875.180984] xhci_hcd 0000:0f:00.0: hcd_pci_runtime_suspend: 0
[ 2875.192035] xhci_hcd 0000:0e:00.4: Setting command ring address to 0xffffe001
[ 2875.192818] xhci_hcd 0000:0e:00.4: xhci_resume: starting usb5 port polling.
[ 2875.192821] xhci_hcd 0000:0e:00.4: xhci_hub_status_data: stopping usb6 port polling
[ 2875.192823] xhci_hcd 0000:0e:00.4: xhci_hub_status_data: stopping usb5 port polling
[ 2875.192824] xhci_hcd 0000:0e:00.4: hcd_pci_runtime_resume: 0
[ 2875.192826] usb usb6: usb auto-resume
[ 2875.192849] hub 6-0:1.0: hub_resume
[ 2875.214526] xhci_hcd 0000:0e:00.4: Get port status 6-1 read: 0x2a0, return 0x2a0
[ 2875.214545] xhci_hcd 0000:0e:00.4: Get port status 6-2 read: 0x2a0, return 0x2a0
[ 2875.214562] hub 6-0:1.0: state 7 ports 2 chg 0000 evt 0000
[ 2875.214584] usb usb5: usb auto-resume
[ 2875.214598] hub 5-0:1.0: hub_resume
[ 2875.214600] xhci_hcd 0000:0e:00.4: Get port status 5-1 read: 0x2a0, return 0x100
[ 2875.214610] xhci_hcd 0000:0e:00.4: Get port status 5-2 read: 0x2a0, return 0x100
[ 2875.214622] hub 5-0:1.0: state 7 ports 2 chg 0000 evt 0000
[ 2875.214629] hub 5-0:1.0: hub_suspend
[ 2875.214630] hub 5-0:1.0: HUBHANG hub_suspend+0xf1/0x250 [usbcore] -> hub_quiesce() flush post resume work
[ 2875.214641] hub 5-0:1.0: HUBHANG post resume work flush not needed
[ 2875.214649] usb usb5: bus auto-suspend, wakeup 1
[ 2875.214673] xhci_hcd 0000:0e:00.4: xhci_hub_status_data: stopping usb5 port polling
[ 2875.226565] xhci_hcd 0000:0e:00.3: Setting command ring address to 0xffffe001
[ 2875.227340] xhci_hcd 0000:0e:00.3: xhci_resume: starting usb3 port polling.
[ 2875.227343] xhci_hcd 0000:0e:00.3: xhci_hub_status_data: stopping usb4 port polling
[ 2875.227346] xhci_hcd 0000:0e:00.3: xhci_hub_status_data: stopping usb3 port polling
[ 2875.227347] xhci_hcd 0000:0e:00.3: hcd_pci_runtime_resume: 0
[ 2875.227350] usb usb4: usb auto-resume
[ 2875.227372] hub 4-0:1.0: hub_resume
[ 2875.250541] xhci_hcd 0000:0e:00.3: Get port status 4-1 read: 0x2a0, return 0x2a0
[ 2875.250574] xhci_hcd 0000:0e:00.3: Get port status 4-2 read: 0x2a0, return 0x2a0
[ 2875.250596] hub 4-0:1.0: state 7 ports 2 chg 0000 evt 0000
[ 2875.250629] usb usb3: usb auto-resume
[ 2875.250646] hub 3-0:1.0: hub_resume
[ 2875.250649] xhci_hcd 0000:0e:00.3: Get port status 3-1 read: 0x2a0, return 0x100
[ 2875.250662] xhci_hcd 0000:0e:00.3: Get port status 3-2 read: 0x2a0, return 0x100
[ 2875.250677] hub 3-0:1.0: state 7 ports 2 chg 0000 evt 0000
[ 2875.250685] hub 3-0:1.0: hub_suspend
[ 2875.250687] hub 3-0:1.0: HUBHANG hub_suspend+0xf1/0x250 [usbcore] -> hub_quiesce() flush post resume work
[ 2875.250701] hub 3-0:1.0: HUBHANG post resume work flush not needed
[ 2875.250712] usb usb3: bus auto-suspend, wakeup 1
[ 2875.250732] xhci_hcd 0000:0e:00.3: xhci_hub_status_data: stopping usb3 port polling
[ 2875.250747] usb usb2: usb auto-resume
[ 2875.250754] hub 2-0:1.0: hub_resume
[ 2875.278530] xhci_hcd 0000:0c:00.0: Get port status 2-1 read: 0x2a0, return 0x2a0
[ 2875.278553] xhci_hcd 0000:0c:00.0: Get port status 2-2 read: 0x2a0, return 0x2a0
[ 2875.278568] xhci_hcd 0000:0c:00.0: Get port status 2-3 read: 0x2a0, return 0x2a0
[ 2875.278581] xhci_hcd 0000:0c:00.0: Get port status 2-4 read: 0x2a0, return 0x2a0
[ 2875.278593] xhci_hcd 0000:0c:00.0: Get port status 2-5 read: 0x2a0, return 0x2a0
[ 2875.278610] hub 2-0:1.0: state 7 ports 5 chg 0000 evt 0000
[ 2875.418535] hub 6-0:1.0: HUBHANG hub_post_resume()
[ 2875.418551] xhci_hcd 0000:0e:00.4: set port remote wake mask, actual port 6-1 status  = 0xe0002a0
[ 2875.418571] xhci_hcd 0000:0e:00.4: set port remote wake mask, actual port 6-2 status  = 0xe0002a0
[ 2875.418578] hub 6-0:1.0: hub_suspend
[ 2875.418580] hub 6-0:1.0: HUBHANG hub_suspend+0xf1/0x250 [usbcore] -> hub_quiesce() flush post resume work
[ 2875.418597] hub 6-0:1.0: HUBHANG post resume work flush not needed
[ 2875.418606] usb usb6: bus auto-suspend, wakeup 1
[ 2875.418630] xhci_hcd 0000:0e:00.4: xhci_hub_status_data: stopping usb6 port polling
[ 2875.418635] xhci_hcd 0000:0e:00.4: config port 6-1 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
[ 2875.418651] xhci_hcd 0000:0e:00.4: config port 6-2 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
[ 2875.418672] xhci_hcd 0000:0e:00.4: config port 5-1 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
[ 2875.418693] xhci_hcd 0000:0e:00.4: config port 5-2 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
[ 2875.418695] xhci_hcd 0000:0e:00.4: xhci_suspend: stopping usb5 port polling.
[ 2875.418713] xhci_hcd 0000:0e:00.4: Setting command ring address to 0xffffe001
[ 2875.419493] xhci_hcd 0000:0e:00.4: hcd_pci_runtime_suspend: 0
[ 2875.458525] hub 4-0:1.0: HUBHANG hub_post_resume()
[ 2875.458537] xhci_hcd 0000:0e:00.3: set port remote wake mask, actual port 4-1 status  = 0xe0002a0
[ 2875.458555] xhci_hcd 0000:0e:00.3: set port remote wake mask, actual port 4-2 status  = 0xe0002a0
[ 2875.458560] hub 4-0:1.0: hub_suspend
[ 2875.458562] hub 4-0:1.0: HUBHANG hub_suspend+0xf1/0x250 [usbcore] -> hub_quiesce() flush post resume work
[ 2875.458575] hub 4-0:1.0: HUBHANG post resume work flush not needed
[ 2875.458583] usb usb4: bus auto-suspend, wakeup 1
[ 2875.458603] xhci_hcd 0000:0e:00.3: xhci_hub_status_data: stopping usb4 port polling
[ 2875.458608] xhci_hcd 0000:0e:00.3: config port 4-1 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
[ 2875.458624] xhci_hcd 0000:0e:00.3: config port 4-2 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
[ 2875.458646] xhci_hcd 0000:0e:00.3: config port 3-1 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
[ 2875.458667] xhci_hcd 0000:0e:00.3: config port 3-2 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
[ 2875.458668] xhci_hcd 0000:0e:00.3: xhci_suspend: stopping usb3 port polling.
[ 2875.458686] xhci_hcd 0000:0e:00.3: Setting command ring address to 0xffffe001
[ 2875.459466] xhci_hcd 0000:0e:00.3: hcd_pci_runtime_suspend: 0
[ 2875.486515] hub 2-0:1.0: HUBHANG hub_post_resume()
[ 2875.486526] xhci_hcd 0000:0c:00.0: set port remote wake mask, actual port 2-1 status  = 0xe0002a0
[ 2875.486539] xhci_hcd 0000:0c:00.0: set port remote wake mask, actual port 2-2 status  = 0xe0002a0
[ 2875.486548] xhci_hcd 0000:0c:00.0: set port remote wake mask, actual port 2-3 status  = 0xe0002a0
[ 2875.486557] xhci_hcd 0000:0c:00.0: set port remote wake mask, actual port 2-4 status  = 0xe0002a0
[ 2875.486566] xhci_hcd 0000:0c:00.0: set port remote wake mask, actual port 2-5 status  = 0xe0002a0
[ 2875.486572] hub 2-0:1.0: hub_suspend
[ 2875.486574] hub 2-0:1.0: HUBHANG hub_suspend+0xf1/0x250 [usbcore] -> hub_quiesce() flush post resume work
[ 2875.486586] hub 2-0:1.0: HUBHANG post resume work flush not needed
[ 2875.486593] usb usb2: bus auto-suspend, wakeup 1
[ 2875.486601] xhci_hcd 0000:0c:00.0: xhci_hub_status_data: stopping usb2 port polling
