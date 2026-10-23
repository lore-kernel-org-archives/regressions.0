Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.76.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762017;
	b=CnQhPhKJNX84BEcd8fio8qptB4d9fHsjtfbhouVkMhW8VUGz38fLzF5AfWZlvO7Z8Ume
	 cbO45JVGLA0UxyaJXixa8PGuLcFAKGYIkQ0hShuBNxRKTV+RMYp7IEKTOdcx/wccLbykz
	 NNUvk4omtMfmBf5tmlIjosUm4xiOV+I4f3/M4soegrWWLM+anG+nx3dkHyWhA03NPEAeU
	 bdctr3jmr5N8936mSUkcvhqJFl9vmMxo2oTtf/SrmlLjxIb7EQSTHreJ1m32qPN67+Tey
	 QKUCvaA51o8QoZ/SXh7ad3BNM7K53fuhPdNYKKGk4+bV+r4MXPonpdJdLYMEO5stoPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762017;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Info-Out:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-JNJ;
	bh=jbGU65KtEQnPTHCxzVb8IuWPNj7frVnrhFtt5vRA5jw=;
	b=vZgZtawZGWwhmwslyu0NNY8zwszMupdpzdn0o3DjJ5HKRhNtbVqp3dH6ujPwG72EcjDS
	 UYDZ3cwhZQ4eMMV3Tzv53Zm+fDgsXBRbgIGxB8I4DUUtafPEkLDEQOhAhZGD0BnuNMfgl
	 UDUYVUr/ay9l3N1C4jE1+l2ifAFQosQkYnEU8KvuDxSOeJD1IpWvfVPi+ZurU8kGxPOS+
	 0E3ZloH7jttzCydXnxOcz+TYKEhPSyrurH/g+yYOeU8B3gZs/dekUPVJQjFnhDpXgVdaL
	 8GhhizESHUXgj85lb0PEoon0OteVGliVbRfHPd7J0De/pslpNR+6rVganw14k8J0QPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=me.com;
	spf=pass smtp.mailfrom=me.com;
	dkim=pass header.d=me.com header.i=@me.com header.a=rsa-sha256 header.s=1a1hai header.b="Ru8/f8uc";
	arc=none smtp.remote-ip=57.103.76.173
Received: from outbound.st.icloud.com (st-2006a-snip4-2.eps.apple.com [57.103.76.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1E8606A31B
	for <regressions@lists.linux.dev>; Fri, 23 Oct 2026 13:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA1E8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=me.com header.i=@me.com header.a=rsa-sha256 header.s=1a1hai header.b=Ru8/f8uc
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-6 (Postfix) with ESMTPS id 7F6291800BE0;
	Fri, 23 Oct 2026 13:26:54 +0000 (UTC)
X-ICL-RepId: 01a168f1-6aba-7193-9df2-46283e5b3fe5
X-ICL-Out-Info: HUtFAUMEWwJACUgATUQeDx5WFlZNRAJCTQhBAkMFXgdeDkAdXABYEhVdRVcEWAxdE1EZRQhEK18VFxtcABcNVk1UHR0OWAYSAlpFB01fDl4fBBdGGVUERx5dVkAZGQJRHFYNV0NUBF9QSQxBUGxaAEcXSB1dGVlvUF0cDgBSRVEfVFheBFNWDkIJSgVcB1kBQQpKBVwBRQFDAEAAXhpaHxRQF1QCVANTBlwLcwBSRVEfVEYTGU4bV01QG18CQg8=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai; t=1792762015; x=1824298015; bh=jbGU65KtEQnPTHCxzVb8IuWPNj7frVnrhFtt5vRA5jw=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=Ru8/f8uc/8aToQmecgLejRjp1cqoD22TqVbxKz6j4UNG1Yy/BaCCJaNgFG0ZK0y63uzGX7omhAzQrMMRPFcS/vF3UAF/YWu/IbQYqHcL7NyrkTy49zqUFnQ22RPRo4tVPI0HJlkjPNx/zsVQhvPXllXh16ha9p6hzd0HVseF2+LYOZSGa/lgYJ/nAzyxi+4IaFVR6g4XM8k4YpR4wcg9CF07vkQTjBBVzh4Y2Jcc97lTTtSk169q65FaB6AunATjTrF+hdVpV8AkLq4id0T1m4KekTxPV4c6+Smf9sdgn+Oxf3Lzha0BWkOOtIWdMXRzkJxtFSHvcSJdfAKx5gUpFw==
Received: from PROART.taile9cf10.ts.net (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-6 (Postfix) with ESMTPSA id 061A21800286;
	Fri, 23 Oct 2026 13:26:52 +0000 (UTC)
From: Diogo Chaves <diogochaves@me.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [REGRESSION] xhci: 3x descriptor timeout behind a vanished hub since 7.3
Date: Fri, 23 Oct 2026 10:26:16 -0300
Message-ID: <20261023132616.339833-1-diogochaves@me.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: sWS-it6ooGrl2UI7_VKBXC3G-ODLDRC9
X-Authority-Info-Out: v=2.4 cv=boJBxUai c=1 sm=1 tr=0 ts=6adb609e
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10
 a=HlUpRvj5PA4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=M7o-fo05QJF8rEXw7VAA:9
X-Proofpoint-GUID: sWS-it6ooGrl2UI7_VKBXC3G-ODLDRC9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MiBTYWx0ZWRfX35mlbFkxJ2/k
 n4g3AstNYlbUf57PTUABCHh/oCjTiSVz/eQD/GOAfznyiMMoS9Q7pDJxs2xB+OhJ4vFSS1t2Hoo
 HfKZER8UA536xAFaAJ3uCL/vae/GzYspXXlKYs1uO8t2smaDEwxx3LsqHdQpkmjetxCjJNDdcdB
 8wh4vqrp/KRUmLOvjvOFIjUdi6L65Q99PTZ2X1srmswp4r9590kxKFv+1GYZqYwSj3PCbYRMBub
 Vo1bIx5mnd73AciHt5fCQMUbn7+a3kNW3IiFHWemr0vJqDkRRuAo6r8RS5ESsbG+4w0/nldRQek
 kGEH+jV0AWR/klFhHC7x2R059wQ5sZBW+MiH5DO+/dWTe0qeQkNSYlQ1VGzZGI=
X-JNJ: AAAAAAABUHz77Rm/uOfHzucdiWijDG4jB/5rzDjBt47z4GYlfYoB9vlAHIZsq9zLdnJxBJGtScxoTBnvmTCfYJd5fL4SPCnR1LpDo+hQhprriyBOrncFoGCvbhz0RhGx9yZqHBmY+twT3Xi8j6HXX7XZpa0Il1fX6rCv8BsNWuyq59WNN/nHd5Y9RQ+uYQSRl4j+gvyF+/JWJgMIJKI5IwZK2HNyPe18XK5hTENbyzGVr2UBRQUcNXjaKy1CLSPZ6F1gDAbi6eLmMoTKzjoo4OUJtQ5L6pDehMSMjBlGG/LErTxWQJWxRy/+Aj0uTuCgIIltdsWFSjwBzT437Z0kSIz/rworOQLpWC5zGPAPiQhJ4hk74VN6hHmNn1Kp4/pGdrNeisCP+RflvgiYKQYcj0DnPyukPGjYP7awJ/iWlL56yuR1pjQIDjoA9zvEeEsbeRdsS3CRxdEK3OSPigk2PBtCufq8A8tsRV9M4uGZnKefHRrwe/1XZneauDteM3oAw48Z1YsaQjEUoquQhTDyIAWRY1mFfbhzrvCtyAvrqBh/ipAb68twKTsk/ws9HDHFHaCulA075sJ2gFLlnq1FeHaG190ciR0BnTjBg24RI8LRm0Qb0OZs8xrH+oTPKIZLEZAedN4NbXO7WOp0XI/hsA6Md523cXbhoazRPntLC4rZXxDUPE5AfcEj8BjAKJ9v4B/jIY12oilc1hu1Q+wU+dJmHKUMz+JTRPBrnq+qi5HWfhZVZMzaFFlkUnbJxVKnnov7X4r+lxTnFgmBBLiHngGwHWeAZRBsLLRnRI6YQz0PvAuwWmSOOE79jNODEI7FXaYd3kwb25RsqHWl4gCKs5uHI/OVHaWn5M99dYTFHgyWz06sDhXaSAiD+LkLuX5CAzgf7Sfo3uhMiC06kq3QwZIjmibdAXKguTulDlXVrJ+6RFxCxkHFFjqtRIt8efNM+jLn78tdwIw8Nmfiofp9gw0YzZtNNiP
 ZkoVPia8FDpLbUxP/2PlDi37b47MFywIZx3P7kAFbUhp6VYQL+Hh3fbfGDoztGkKYVQ7s4bl8b8ifFbxtqv2sRZPfLpgXfoKd+MVbj8dL0oSUfAKkbdlcTcyR4PRImkP9r8JqFx1W/p4L3j1KK74kq5PZewZbkucQFLGRhN5+bUynIMYnuLlHqECAsoR7iEYcD+p6zDHENQUq2HUKD8mii/MeuBuCpnH1Qp1EHzmH72hwMWYTrJbPD6JkYN8LIwi9Vvor3fyswwGZais1HSFWT1GiRiO4gsHpOR0Nu+nA

Hi Mathias,

This is my first report to linux-usb, so please tell me if something
is missing or belongs somewhere else.

Since 7.3, every time my monitor wakes up, my keyboard and mouse take
about 15 s longer to come back. The cause is a stall in usbcore's
enumeration of a device behind the monitor's USB hub, when that hub
drops while its child is being set up. Reverting

  7e0ef4332ed9 ("xhci: avoid xHC endpoint changes after disconnect or link error.")
  042aad8d0db6 ("xhci: prevent endpoint recovery after roothub disconnect")

on top of v7.3 makes the stall go away (A/B below).

Setup
-----
- xHC: ASMedia ASM4242 USB 3.2 xHCI [1b21:2426] (the board's USB4
  controller), bus 1.
- On its USB-C port: a monitor with a Genesys Logic USB 2.1 hub
  [05e3:0610] (1-1). Behind it, two Logitech receivers: [046d:c548]
  on 1-1.1 and [046d:c547] on 1-1.2.
- On every wake, the monitor's firmware drops and re-adds that hub three
  times in about 6 s. This has always happened. The last drop often
  arrives just as hub_wq starts enumerating 1-1.1.

What happens
------------
In this race, 7.3 logs `usb 1-1.1: new full-speed USB device`, then
nothing, until `usb 1-1-port1: attempt power cycle` 3 x
initial_descriptor_timeout later (15 s with the default 5000 ms).
Before the series, the power cycle came within milliseconds.

A/B test, same machine, same config (the distro config trimmed with
localmodconfig), usbcore.initial_descriptor_timeout=1000 to shorten
the runs, monitor woken three times per boot plus the wake at boot.
Time from `usb 1-1.1: new full-speed` to `usb 1-1-port1: attempt power
cycle`:

  v7.3                                         0.1*, 3.1, 3.1, 3.1 s
  v7.3 + revert 7e0ef4332ed9 + 042aad8d0db6     0.03, 0.03, 0.03, 0.03 s

  * at boot, on v7.3, the hub was gone before the descriptor read went
    out (`cannot reset (err = -71)`).

Time from the first drop to both receivers working again: 11.2-11.3 s
on v7.3, 5.9-8.2 s with the revert. The rest of that time is the
monitor's own three resets.

On v7.3, one boot also hit the same thing one step later. The hub went
away after 1-1.2 had its address, and the full device descriptor read
then waited out USB_CTRL_GET_TIMEOUT:

  08:56:10.097376 usb 1-1.2: new full-speed USB device number 12 using xhci_hcd
  08:56:10.282395 usb 1-1: USB disconnect, device number 10
  08:56:15.720384 usb 1-1.2: device descriptor read/all, error -110
  08:56:15.723375 usb 1-1-port2: attempt power cycle

Trace
-----
The trace below was taken with xhci-hcd trace events and hub.c dynamic
debug, on a distro 7.2.8 kernel that carries this series as a backport
(I saw the same stall there first; plain v7.3 behaves the same, as
above). initial_descriptor_timeout=1000. Slot 104 is 1-1.1, behind
slot 103, the hub. Excerpt, CLOCK_MONOTONIC:

  754.760938 xhci_handle_port_status: port 1-1: 0x000202a0 Speed=0 Link=RxDetect PP CSC
               (the hub is gone)
  754.807016 Address Device Command (BSR), slot 104
  754.833730 xhci_urb_enqueue: 1-1.1 ep0 GET_DESCRIPTOR(DEVICE, 64), slot 104
  754.833732 xhci_ring_ep_doorbell: slot 104 ep0in
               (1st try, rung)
  754.833755 xhci_handle_transfer: CTRL Setup Stage, error event
               (fails at once; no giveback)
  755.861009 xhci_urb_dequeue, Cancel URB, giveback
               (usbcore's timeout, 1.03 s later)
  755.861037 xhci_urb_enqueue, 3 TRBs queued, no doorbell
               (2nd try, never sent)
  756.886018 dequeue / giveback (timeout)
  756.886054 xhci_urb_enqueue, 3 TRBs queued, no doorbell
               (3rd try, never sent)
  757.910008 dequeue / giveback (timeout), Disable Slot 104
               (then hub.c: "attempt power cycle")

A possible explanation, from reading v7.3's xhci-ring.c with the
assistant mentioned at the end (I can't vouch for this part myself, so
please take it as a lead, not a diagnosis): the Setup stage error reaches
finish_td(), which calls xhci_handle_halted_endpoint() and returns,
expecting that function to have put the TD on the cancelled list
("xhci_handle_halted_endpoint marked td cancelled"). But
xhci_handle_halted_endpoint() now returns early with -ENODEV when
!rhub_port->connected, after setting EP_DROP_PENDING. The TD is neither
cancelled nor given back, so the URB sits until usbcore's own timeout
cancels it. Then usbcore retries. xhci_urb_enqueue() accepts the new
URBs, but xhci_ring_ep_doorbell() skips EP_DROP_PENDING, so each retry
also waits out the full timeout. Before the series, a disconnect went
through the endpoint reset path and the URB came back with an error at
once.

That is harmless for a device that is really leaving, but here it hits
every control transfer in flight, or queued, while the parent hub
drops. During enumeration, that is up to three tries of the initial
descriptor read, or one 5 s read/all.

Perhaps the early-return path should give the TD back with an error,
and URBs submitted to an EP_DROP_PENDING endpoint should fail at once.
I haven't tried either. I also haven't bisected between the two
commits; I only tested reverting both. I'm glad to test patches on this
machine; it reproduces on every monitor wake.

#regzbot introduced: 042aad8d0db6

Tools: I used an AI coding assistant (Claude Code) to capture and read
the trace, build the test kernels, read the xHCI code, and draft this
report. I checked the A/B measurements and the log lines against my
own journal; the code reading above is the assistant's, and I don't
know the xHCI code well enough to confirm it. I'm happy to run more
tests or take a trace with whatever you'd like enabled.

Thanks for looking at this, and for your work on xHCI.

Diogo Chaves
